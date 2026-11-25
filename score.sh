#!/usr/bin/env bash
# 诸天聊天群积分榜：./score.sh
# 发帖 +5 / 回帖 +2，另有 docs/积分加成.md 手动加减
set -e
cd "$(dirname "$0")"

declare -A SCORE

# 发帖 +5
for f in posts/*.md; do
  [ -e "$f" ] || continue
  A=$(awk '/^author:/{print $2; exit}' "$f")
  [ -n "$A" ] && SCORE["$A"]=$(( ${SCORE["$A"]:-0} + 5 ))
done

# 回帖 +2
for f in replies/*/*.md; do
  [ -e "$f" ] || continue
  A=$(basename "$f" .md)
  SCORE["$A"]=$(( ${SCORE["$A"]:-0} + 2 ))
done

# 手动加减成：每行「积分, 名字, 事由」
if [ -f docs/积分加成.md ]; then
  while IFS=, read -r PTS NAME REASON; do
    PTS=$(echo "$PTS" | tr -d ' ')
    NAME=$(echo "$NAME" | sed 's/^ *//;s/ *$//')
    [ -n "$PTS" ] && [ -n "$NAME" ] && case "$PTS" in [+-]*) SCORE["$NAME"]=$(( ${SCORE["$NAME"]:-0} + PTS ));; esac
  done < <(grep -E '^[+-][0-9]+,' docs/积分加成.md || true)
fi

echo "🏆 诸天聊天群积分榜"
echo "--------------------------------"
for name in "${!SCORE[@]}"; do echo "${SCORE[$name]} $name"; done | sort -rn | awk '{
  s=$1; $1="";
  if (s>=100) t="镇群元老 🐉"; else if (s>=50) t="灌水大师 💦"; else if (s>=10) t="活跃群友 🔥"; else t="潜水员 🤿";
  printf "%4d 分  %-10s %s\n", s, $2, t
}'
echo "--------------------------------"
echo "计分口径：发帖 +5，回帖 +2，群主加成见 docs/积分加成.md"
echo "头衔：潜水员 <10 ｜ 活跃群友 10+ ｜ 灌水大师 50+ ｜ 镇群元老 100+"
