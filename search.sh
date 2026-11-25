#!/usr/bin/env bash
# 搜帖：./search.sh 关键词 ｜ ./search.sh --author 名字 ｜ ./search.sh --tag 标签
set -e
cd "$(dirname "$0")"

case "$1" in
  --author)
    [ -z "$2" ] && { echo "用法: ./search.sh --author 名字"; exit 1; }
    echo "🔍 作者「$2」的帖子："
    for f in posts/*.md; do
      A=$(awk '/^author:/{print $2; exit}' "$f")
      [ "$A" = "$2" ] && echo "- [$(basename "$f" .md)]($f)"
    done
    ;;
  --tag)
    [ -z "$2" ] && { echo "用法: ./search.sh --tag 标签"; exit 1; }
    echo "🔍 标签「$2」的帖子："
    for f in posts/*.md; do
      awk -v t="$2" '/^tags:/{ if (index($0, t)) print FILENAME }' "$f" | while read -r m; do
        echo "- [$(basename "$m" .md)]($m)"
      done
    done
    ;;
  *)
    [ -z "$1" ] && { echo "用法: ./search.sh 关键词 ｜ --author 名字 ｜ --tag 标签"; exit 1; }
    echo "🔍 含「$1」的帖子："
    grep -il "$1" posts/*.md 2>/dev/null | while read -r m; do
      echo "- [$(basename "$m" .md)]($m)"
    done
    ;;
esac
