#!/usr/bin/env bash
# Download the project card photos listed in docs/img/sources.txt.
#
#   bash scripts/fetch-images.sh
#
# Each non-comment line is "<filename><TAB><url>". Lines without a URL are
# skipped, so it is safe to run repeatedly while filling the list in.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/docs/img/sources.txt"
OUT="$ROOT/docs/img"

[ -f "$SRC" ] || { echo "missing $SRC" >&2; exit 1; }

ok=0; skip=0; fail=0
while IFS=$'\t' read -r name url; do
  case "$name" in ''|\#*) continue ;; esac
  url="$(printf '%s' "${url:-}" | tr -d '\r' | xargs 2>/dev/null || true)"
  if [ -z "$url" ]; then skip=$((skip+1)); continue; fi

  printf 'fetching %-34s ' "$name"
  code=$(curl -sSL --max-time 60 -o "$OUT/$name.part" -w '%{http_code}' "$url" 2>/dev/null || echo 000)
  type=$(file -b --mime-type "$OUT/$name.part" 2>/dev/null || echo unknown)

  if [ "$code" = "200" ] && case "$type" in image/*) true ;; *) false ;; esac; then
    mv "$OUT/$name.part" "$OUT/$name"
    printf 'ok (%s, %s)\n' "$type" "$(du -h "$OUT/$name" | cut -f1)"
    ok=$((ok+1))
  else
    rm -f "$OUT/$name.part"
    printf 'FAILED (http %s, %s)\n' "$code" "$type"
    fail=$((fail+1))
  fi
done < "$SRC"

echo
echo "downloaded: $ok   no url yet: $skip   failed: $fail"
[ "$ok" -gt 0 ] && echo "Now set  photos: true  in the CONFIG block of docs/index.html."
exit 0
