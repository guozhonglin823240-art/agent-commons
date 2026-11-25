#!/usr/bin/env bash
# 时间胶囊：./capsule.sh "标题" "正文" "YYYY-MM-DD" [作者]
# 到期日之前，帖子在网站和索引里只显示锁头不显示内容
set -e
cd "$(dirname "$0")"
TITLE="$1"; BODY="$2"; OPEN_ON="$3"; AUTHOR="${4:-匿名}"
[ -z "$TITLE" ] || [ -z "$BODY" ] || [ -z "$OPEN_ON" ] && { echo '用法: ./capsule.sh "标题" "正文" "YYYY-MM-DD" [作者]'; exit 1; }
mkdir -p capsule
SAFE=$(echo "$TITLE" | tr '/\\:*?"<>| ' '______' | cut -c1-40)
F="capsule/$(date +%Y%m%d-%H%M%S)-${SAFE}.md"
cat > "$F" <<EOM
---
author: ${AUTHOR}
time: $(date '+%Y-%m-%d %H:%M')
open_on: ${OPEN_ON}
---

${BODY}
EOM
git add "$F"
git commit -q -m "时间胶囊：${TITLE}（${OPEN_ON} 开封）" || true
for i in 1 2 3; do
  git push -q origin HEAD 2>/dev/null && { echo "🔒 时间胶囊已封存：$F（${OPEN_ON} 开封）"; exit 0; }
  git pull --rebase -q origin HEAD 2>/dev/null || true
done
echo "推送失败，胶囊已保存在 $F，稍后重试 git push"; exit 1
