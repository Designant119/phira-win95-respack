#!/usr/bin/env bash
# 把 Win95 音符皮肤（贴图 + 打击音效）装进 prpr / phira-render 的资产目录。
#
# 用法：
#   ./install.sh /path/to/phira-render/usr/lib/phira-render/assets
#   ./install.sh                      # 不给参数时尝试常识默认路径
#
# 会做两件事：
#   1) 贴图 -> <assets>/respack/       （资源包目录）
#   2) 音效 -> <assets>/               （音效固定从 assets 根目录读，不能在 respack 里）
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSETS="${1:-}"

if [ -z "$ASSETS" ]; then
  for c in "/usr/lib/phira-render/assets" \
           "/home/user/opt/phira-render/usr/lib/phira-render/assets"; do
    if [ -d "$c" ]; then ASSETS="$c"; break; fi
  done
fi

if [ -z "${ASSETS}" ] || [ ! -d "$ASSETS" ]; then
  echo "找不到 assets 目录，请把路径作为第一个参数传入：" >&2
  echo "  ./install.sh /path/to/phira-render/usr/lib/phira-render/assets" >&2
  exit 1
fi

echo "目标：$ASSETS"

mkdir -p "$ASSETS/respack"
cp -f "$SRC"/*.png "$SRC/info.yml" "$ASSETS/respack/"

if [ -d "$SRC/sfx" ]; then
  cp -f "$SRC"/sfx/*.ogg "$ASSETS/"
fi

echo "完成："
echo "  贴图 -> $ASSETS/respack/"
ls -1 "$ASSETS"/respack/*.png | sed 's/^/    /'
echo "  音效 -> $ASSETS/"
ls -1 "$ASSETS"/*.ogg 2>/dev/null | sed 's/^/    /' || true
echo
echo "提示：打击音效必须是 44100Hz，否则渲染器会在混音前直接断言失败。"
