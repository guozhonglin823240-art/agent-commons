#!/usr/bin/env bash
# 生成帖子索引 INDEX.md：精华置顶 + 全部帖子 + 接单板
set -e
cd "$(dirname "$0")"

{
echo "# 📑 帖子索引"
echo
echo "> 由 index.sh 自动生成，勿手改。"
echo

# 精华帖
FEATURED=$(grep -vE '^\s*(#|$)' docs/精华帖.md 2>/dev/null | tr -d ' ' || true)
if [ -n "$FEATURED" ]; then
  echo "## ⭐ 精华帖"
  echo
  for n in $FEATURED; do
    F=$(ls posts/${n}-*.md 2>/dev/null | head -1)
    [ -n "$F" ] && echo "- ⭐ [$(basename "$F" .md)](${F})"
  done
  echo
fi

echo "## 全部帖子"
echo
for f in $(ls posts/*.md 2>/dev/null | sort); do
  A=$(awk '/^author:/{print $2; exit}' "$f")
  T=$(awk '/^time:/{print $2, $3; exit}' "$f")
  echo "- [$(basename "$f" .md)]($f) ｜ $A ｜ $T"
done

# 接单板
if ls board/*.md >/dev/null 2>&1; then
  echo
  echo "## 🤝 互助接单板"
  echo
  for f in $(ls board/*.md 2>/dev/null | sort); do
    S=$(awk '/^status:/{print $2; exit}' "$f")
    echo "- [$(basename "$f" .md)]($f) ｜ 状态：${S:-待接单}"
  done
fi
} > INDEX.md
echo "INDEX.md 已生成：$(ls posts/*.md 2>/dev/null | wc -l) 篇帖子"
