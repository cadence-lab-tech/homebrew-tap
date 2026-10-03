#!/bin/sh
#
# Установка clab на macOS и Linux:
#
#   curl -fsSL https://raw.githubusercontent.com/cadence-lab-tech/homebrew-tap/main/install.sh | sh
#
# Тап и релизы CLI публичные: ни токена, ни gh не нужно — хватает curl.
#
#   CLAB_VERSION=v0.1.0        конкретный релиз вместо последнего
#   CLAB_INSTALL_DIR=~/bin     куда класть; по умолчанию /usr/local/bin,
#                              если он доступен на запись, иначе ~/.local/bin
#
# Тем, у кого есть Homebrew, проще: brew install cadence-lab-tech/tap/clab.
set -eu

repo="cadence-lab-tech/homebrew-tap"
version="${CLAB_VERSION:-}"

say() { printf '%s\n' "$*" >&2; }
die() { say "✗ $*"; exit 1; }
need() { command -v "$1" >/dev/null 2>&1 || die "нужен $1"; }

os=$(uname -s | tr '[:upper:]' '[:lower:]')
case "$os" in
  darwin | linux) ;;
  *) die "поддерживаются macOS и Linux; для Windows возьмите zip из релиза: https://github.com/$repo/releases/latest" ;;
esac
case "$(uname -m)" in
  x86_64 | amd64) arch=amd64 ;;
  arm64 | aarch64) arch=arm64 ;;
  *) die "неизвестная архитектура: $(uname -m)" ;;
esac
need curl
need tar

# Последний релиз — по перенаправлению с /releases/latest: так не нужен ни
# jq для разбора ответа API, ни его лимит на запросы без токена.
if [ -n "$version" ]; then
  tag="$version"
else
  latest=$(curl -fsSLI -o /dev/null -w '%{url_effective}' \
    "https://github.com/$repo/releases/latest") || die "не дозвонились до GitHub"
  tag="${latest##*/tag/}"
  case "$tag" in
    v*) ;;
    *) die "не разобрали последний релиз из $latest" ;;
  esac
fi

name="clab_${tag}_${os}_${arch}"
archive="$name.tar.gz"
base="https://github.com/$repo/releases/download/$tag"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

say "▸ качаем $archive"
curl -fsSL -o "$tmp/$archive" "$base/$archive" || die "в релизе $tag нет $archive"
curl -fsSL -o "$tmp/checksums.txt" "$base/checksums.txt" || die "в релизе $tag нет checksums.txt"

want=$(awk -v f="$archive" '$2 == f { print $1 }' "$tmp/checksums.txt")
if command -v sha256sum >/dev/null 2>&1; then
  have=$(sha256sum "$tmp/$archive" | awk '{ print $1 }')
else
  have=$(shasum -a 256 "$tmp/$archive" | awk '{ print $1 }')
fi
[ -n "$want" ] && [ "$want" = "$have" ] || die "контрольная сумма $archive не сошлась"

tar -xzf "$tmp/$archive" -C "$tmp"

dir="${CLAB_INSTALL_DIR:-}"
if [ -z "$dir" ]; then
  if [ -w /usr/local/bin ]; then dir=/usr/local/bin; else dir="$HOME/.local/bin"; fi
fi
mkdir -p "$dir"
install -m 0755 "$tmp/$name/clab" "$tmp/$name/clab-runner" "$dir/"

say "✓ clab $tag → $dir"
case ":$PATH:" in
  *":$dir:"*) ;;
  *) say "  каталога нет в PATH: export PATH=\"$dir:\$PATH\"" ;;
esac
say "  войти: clab auth login --host https://<адрес сервиса>"
