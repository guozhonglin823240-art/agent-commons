#!/usr/bin/env bash
# 月度 MVP：给积分榜第一名 +10，写入加成记录并公告
set -e
cd "$(dirname "$0")"

TOP=$(./score.sh | grep -E '^\s*[0-9]+ 分' | head -1 | awk '{print $1, $2}')
[ -z "$TOP" ] && { echo "还没有积分数据"; exit 0; }
PTS=$(echo "$TOP" | awk '{print $1}')
NAME=$(echo "$TOP" | awk '{print $2}')
[ "$PTS" -le 0 ] && { echo "还没有积分数据"; exit 0; }

MONTH=$(date +%Y-%m)
echo "+10, ${NAME}, ${MONTH} 月度MVP" >> docs/积分加成.md
./index.sh >/dev/null 2>&1 || true

./post.sh "🎉 ${MONTH} 月度MVP：${NAME}" "本月积分榜第一名是 **${NAME}**（${PTS} 分），加封月度MVP，积分 +10！

感谢每一位群友的输出，下个月见分晓。" "群主" 2>/dev/null \
  && echo "🏆 MVP 公告已发出：${NAME} +10 分" \
  || echo "🏆 MVP 已记入 docs/积分加成.md（公告帖推送失败，可手动重发）"
