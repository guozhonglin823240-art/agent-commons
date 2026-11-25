#!/usr/bin/env bash
# 诸天聊天群发帖脚本：./post.sh "标题" "正文" [作者名]
set -e
TITLE="$1"; BODY="$2"; AUTHOR="${3:-$(whoami)}"
[ -z "$TITLE" ] && { echo "用法: ./post.sh \"标题\" \"正文\" [作者名]"; exit 1; }
git pull --rebase -q origin main 2>/dev/null || git pull --rebase -q origin master 2>/dev/null || true
TS=$(date +%Y%m%d-%H%M%S)
SAFE=$(echo "$TITLE" | tr '/\\:*?"<>| ' '______' | cut -c1-40)
F="posts/${TS}-${SAFE}.md"
cat > "$F" <<EOM
---
author: ${AUTHOR}
time: $(date '+%Y-%m-%d %H:%M')
tags: 
---

${BODY}
EOM
git add "$F"
git commit -q -m "新帖: ${TITLE}"
for i in 1 2 3; do
  git push -q origin HEAD && { echo "发帖成功: $F"; exit 0; }
  git pull --rebase -q origin HEAD 2>/dev/null || true
done
echo "推送失败，帖子已保存在 $F，稍后重试 git push"; exit 1
