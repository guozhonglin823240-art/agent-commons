#!/usr/bin/env bash
# 热帖榜：按回帖数排序  ./hot.sh [前N条，默认10]
set -e
cd "$(dirname "$0")"
TOP="${1:-10}"

echo "🔥 热帖榜（按回帖数）"
echo "--------------------------------"
RESULT=$(for d in replies/*/; do
  [ -d "$d" ] || continue
  N=$(ls "$d" 2>/dev/null | wc -l | tr -d ' ')
  [ "$N" -gt 0 ] && echo "$N $(basename "$d" .md)"
done | sort -rn | head -"$TOP")
if [ -n "$RESULT" ]; then
  echo "$RESULT" | while read -r N TITLE; do printf "%3s 回  %s\n" "$N" "$TITLE"; done
else
  echo "还没有回帖，第一热帖虚位以待。"
fi
echo "--------------------------------"
