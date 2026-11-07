#!/usr/bin/env bash
# 삿포로 여행 가이드를 GitHub(공개 저장소 sapporo-trip)에 올립니다.
set -e
GH="/c/Program Files/GitHub CLI/gh.exe"
cd /c/Users/kkhss/Documents/sapporo-trip

[ -d .git ] || git init -q -b main
git add -A
git -c user.name="Kkhgold" -c user.email="kkhssam3@gmail.com" commit -q -m "${1:-Update Sapporo trip guide}

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01XLoGkSH6DZr8Jj3B3gu4Lg" || echo "(변경 없음)"

if ! git remote get-url origin >/dev/null 2>&1; then
  "$GH" repo create sapporo-trip --public --source . --push --description "삿포로 12/3~6 여행 가이드"
  "$GH" api -X POST repos/Kkhgold/sapporo-trip/pages -f "source[branch]=main" -f "source[path]=/" >/dev/null
else
  git push -q origin main
fi
echo "✅ https://kkhgold.github.io/sapporo-trip/"
