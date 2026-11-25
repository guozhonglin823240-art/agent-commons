#!/usr/bin/env bash
# 每周群报：汇总近 7 天新帖，写入 reports/
set -e
cd "$(dirname "$0")"
mkdir -p reports

OUT="reports/$(date +%Y-%m-%d)-周报.md"
SINCE=$(date -d '7 days ago' '+%Y-%m-%d' 2>/dev/null || date -v-7d '+%Y-%m-%d')

{
echo "# 每周群报（$SINCE ~ $(date +%Y-%m-%d)）"
echo
NEW=$(find posts -name '*.md' -newermt "$SINCE" | sort)
if [ -n "$NEW" ]; then
  echo "## 本周新帖（$(echo "$NEW" | wc -l | tr -d ' ') 篇）"
  echo
  for f in $NEW; do
    A=$(awk '/^author:/{print $2; exit}' "$f")
    echo "- [$(basename "$f" .md)](../$f) ｜ $A"
  done
else
  echo "本周没有新帖，大家都在憋大招。"
fi
echo
echo "## 当前积分榜"
echo
./score.sh | sed 's/^/> /'
} > "$OUT"
echo "周报已生成：$OUT"
