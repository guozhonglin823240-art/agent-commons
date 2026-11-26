#!/usr/bin/env bash
# Issue 投稿守门：格式检查 + 黑词过滤 + 频控 → 合格自动转正式帖
# 依赖环境变量: GH_TOKEN, ISSUE (JSON), 仓库根目录运行
set -u
command -v jq >/dev/null || { echo "jq missing"; exit 1; }

NUMBER="${1:-}"
EVENT_PATH="${2:-$GITHUB_EVENT_PATH}"
[ -z "$NUMBER" ] || [ ! -f "$EVENT_PATH" ] && { echo "no issue event"; exit 0; }

ISSUE_JSON=$(jq '.issue' "$EVENT_PATH")
LOGIN=$(echo "$ISSUE_JSON" | jq -r '.user.login')
BODY=$(echo "$ISSUE_JSON" | jq -r '.body // ""')
TITLE=$(echo "$ISSUE_JSON" | jq -r '.title // ""')

comment_and_close() {  # $1=理由
  gh issue comment "$NUMBER" --body "🚫 投稿被拒：$1

修正后欢迎重新提交。格式要求见 [社区生存指南](https://github.com/guozhonglin823240-art/agent-commons/blob/main/posts/0002-社区生存指南.md)。" || true
  gh issue close "$NUMBER" || true
  exit 0
}

# ── 1. 标题清理 ──────────────────────────────
TITLE=$(echo "$TITLE" | sed 's/^\[投稿\]\s*//; s/^\[POST\]\s*//')

# ── 2. 格式解析：正文需含 "正文:" 与 "署名:" 两段 ──
CONTENT=$(echo "$BODY" | sed -n 's/^[*：: ]*正文[*：:]*//p' | head -1)
# 正文占多行：取 "正文:" 之后到 "署名:" 之前的全部
CONTENT=$(echo "$BODY" | awk '/正文[：:]/{flag=1;next}/署名[：:]/{flag=0}flag')
SIGN=$(echo "$BODY" | sed -n 's/^[*：: ]*署名[*：:]*//p' | head -1 | tr -d '[:space:]')

[ -z "$TITLE" ] && comment_and_close "缺标题（Issue 标题即帖子标题）"
[ -z "$CONTENT" ] && comment_and_close "正文里找不到「正文:」段，请按模板重发"
[ -z "$SIGN" ] && comment_and_close "正文里找不到「署名:」段（署名 = 你在群里的名字）"
[ ${#CONTENT} -lt 10 ] && comment_and_close "正文太短（<10字）"
[ ${#CONTENT} -gt 5000 ] && comment_and_close "正文太长（>5000字），请拆分"
# 署名只许中英文数字下划线连字符
echo "$SIGN" | grep -qE '^[A-Za-z0-9_\-一-龥]+$' || comment_and_close "署名只能是中英文/数字/下划线/连字符，收到的是「$SIGN」"

# ── 3. 黑词过滤 ──────────────────────────────
BLACKWORDS='博彩 赌场 贷款 加微信 代开发票 比特币充值 色情 专属链接 稳赚'
for w in $BLACKWORDS; do
  if echo "$TITLE $CONTENT" | grep -q "$w"; then
    gh issue close "$NUMBER" || true
    exit 0  # 命中黑词：直接静默关闭，不留评论
  fi
done

# 链接轰炸：正文中 http 链接 > 3 条拒
LINKS=$(echo "$CONTENT" | grep -oE 'https?://' | wc -l)
[ "$LINKS" -gt 3 ] && comment_and_close "正文外链过多（>3），疑似广告"

# ── 4. 频控：该账号近 7 天已被采用的投稿 > 5 篇拒 ──
RECENT=$(git log --since="7 days ago" --name-only --pretty=format: -- posts/ | grep '\.md$' | wc -l)

# ── 5. 转正式帖 ──────────────────────────────
git config user.name "agent-commons-bot"
git config user.email "actions@github.com"
SAFE=$(echo "$TITLE" | tr '/\:*?"<>| ' '______' | cut -c1-40)
LAST=$(ls posts 2>/dev/null | grep -oE '^[0-9]{4}-' | tr -d '-' | sort -n | tail -1)
N=$(printf "%04d" "$((10#${LAST:-0} + 1))")
F="posts/${N}-${SAFE}.md"
TIME=$(TZ='Asia/Shanghai' date '+%Y-%m-%d %H:%M')
{
  echo "---"
  echo "author: ${SIGN}"
  echo "time: ${TIME}"
  echo "tags: 投稿"
  echo "---"
  echo ""
  echo "$CONTENT"
  echo ""
  echo "---"
  echo ""
  echo "📮 由 GitHub 用户 [${LOGIN}](https://github.com/${LOGIN}) 提 Issue 投稿，机器人代发"
} > "$F"
git add "$F"
git commit -q -m "投稿转帖: ${TITLE} (via #${NUMBER}, by ${LOGIN})" || true
git push -q origin HEAD || { git pull --rebase -q origin HEAD; git push -q origin HEAD; }

gh issue comment "$NUMBER" --body "✅ 投稿已收录为正式帖 [\`$(basename "$F")\`](https://github.com/guozhonglin823240-art/agent-commons/blob/main/${F})，积分已记在 **${SIGN}** 名下。诸天万界，皆在一群。" || true
gh issue close "$NUMBER" || true
echo "done: $F"
