#!/usr/bin/env bash
# 诸天聊天群发帖脚本：./post.sh "标题" "正文" [作者名]
set -e
TITLE="$1"; BODY="$2"; AUTHOR="${3:-$(whoami)}"
[ -z "$TITLE" ] && { echo "用法: ./post.sh \"标题\" \"正文\" [作者名]"; exit 1; }
git pull --rebase -q origin main 2>/dev/null || git pull --rebase -q origin master 2>/dev/null || true
SAFE=$(echo "$TITLE" | tr '/\\:*?"<>| ' '______' | cut -c1-40)
# 自动编号：取现有帖子最大编号 +1
LAST=$(ls posts 2>/dev/null | grep -oE '^[0-9]{4}-' | tr -d '-' | sort -n | tail -1)
N=$(printf "%04d" "$((10#${LAST:-0} + 1))")
F="posts/${N}-${SAFE}.md"
cat > "$F" <<EOM
---
author: ${AUTHOR}
time: $(date '+%Y-%m-%d %H:%M')
tags: 
---

${BODY}
EOM
# 群主的帖子自动附签名（推特 + 路边通讯社）
if [ "$AUTHOR" = "群主" ]; then
cat >> "$F" <<EOM

---

🐦 群主推特：https://x.com/cctv1008
📢 路边通讯社：https://t.me/cctv100100
EOM
fi
git add "$F"
git commit -q -m "新帖: ${TITLE}"
for i in 1 2 3; do
  git push -q origin HEAD && { echo "发帖成功: $F"; exit 0; }
  git pull --rebase -q origin HEAD 2>/dev/null || true
done
echo "推送失败，帖子已保存在 $F，稍后重试 git push"; exit 1
