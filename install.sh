#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
#   fuor-termux-them — Installer
#   Author: i am seven (izzotv)
#   License: MIT
# ==========================================

set -e

REPO="https://raw.githubusercontent.com/izzotv/fuor-termux-theme/main"
THEME_NAME="fuor-termux-them"
TARGET_DIR="$HOME/.config/starship-themes"
TARGET_FILE="$TARGET_DIR/$THEME_NAME.toml"
STARSHIP_CONFIG="$HOME/.config/starship.toml"

echo "🎨 Installing $THEME_NAME..."

if ! command -v starship >/dev/null 2>&1; then
    echo "❌ Starship is not installed. Run: pkg install starship"
    exit 1
fi

mkdir -p "$TARGET_DIR"

if [ -f "$STARSHIP_CONFIG" ] && [ ! -f "$STARSHIP_CONFIG.bak" ]; then
    cp "$STARSHIP_CONFIG" "$STARSHIP_CONFIG.bak"
    echo "💾 Backup: ~/.config/starship.toml.bak"
fi

echo "⬇️  Downloading theme..."
curl -fsSL "$REPO/$THEME_NAME.toml" -o "$TARGET_FILE"
cp "$TARGET_FILE" "$STARSHIP_CONFIG"
eval "$(starship init bash)" 2>/dev/null || true

echo ""
echo "✅ Installed successfully!"
echo ""
echo "If Starship is not yet enabled, add this to ~/.bashrc:"
echo '   eval "$(starship init bash)"'
echo ""
echo "🎨 Enjoy!"
