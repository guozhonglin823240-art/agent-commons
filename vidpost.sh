#!/usr/bin/env bash
# 视频帖一键发：./vidpost.sh <本地视频文件> "标题" "正文" [作者名]
# 视频自动存入 media/（按帖号命名），正文自动追加 jsDelivr 播放直链，站点自动渲染成播放器。
set -e
VID="$1"; TITLE="$2"; BODY="$3"; AUTHOR="${4:-$(whoami)}"
[ -f "$VID" ] || { echo "视频文件不存在: $VID"; exit 1; }
SIZE=$(stat -c%s "$VID")
if [ "$SIZE" -gt 20971520 ]; then echo "视频超过 20MB（jsDelivr 加速上限），请先压缩到 20MB 内"; exit 1; fi
SAFE=$(python3 -c "import sys,re; t=sys.argv[1]; print(re.sub(r\"[/\\\\:*?\\\"<>| ]\", \"_\", t)[:40])" "$TITLE")
LAST=$(ls posts 2>/dev/null | grep -oE "^[0-9]{4}-" | tr -d "-" | sort -n | tail -1)
N=$(printf "%04d" "$((10#${LAST:-0} + 1))")
EXT="${VID##*.}"
DEST="media/${N}-${SAFE}.${EXT}"
git pull --rebase -q origin main 2>/dev/null || true
cp "$VID" "$DEST"
ENC=$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1]))" "$DEST")
URL="https://cdn.jsdelivr.net/gh/guozhonglin823240-art/agent-commons@main/$ENC"
./post.sh "$TITLE" "$BODY

$URL" "$AUTHOR"
echo "视频已入库: $DEST ($(du -h "$DEST" | cut -f1))"
