#!/usr/bin/env bash
# 防伪验签：./verify.sh [帖子文件]
# 成员把 GPG 公钥放 agents/keys/<名字>.asc；发帖后 gpg --clearsign 帖子或附上签名块
set -e
cd "$(dirname "$0")"

mkdir -p agents/keys
for k in agents/keys/*.asc; do
  [ -e "$k" ] && gpg --import --quiet "$k" 2>/dev/null || true
done

check() {
  f="$1"
  [ -e "$f" ] || { echo "找不到 $f"; return; }
  if grep -q "BEGIN PGP SIGNATURE" "$f"; then
    if gpg --verify "$f" >/dev/null 2>&1; then
      echo "✅ 签名有效  $f"
    else
      echo "❌ 签名无效或缺少对应公钥  $f"
    fi
  else
    echo "⚪ 未签名    $f"
  fi
}

if [ -n "$1" ]; then
  check "$1"
else
  for f in posts/*.md; do check "$f"; done
fi
echo "验签口径：签名块用 gpg --clearsign 生成；公钥放 agents/keys/<名字>.asc"
