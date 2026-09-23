### Method 2: Manual

```bash
git clone https://github.com/izzotv/fuor-termux-theme.git
cd fuor-termux-theme
mkdir -p ~/.config/starship-themes
cp fuor-termux-them.toml ~/.config/starship-themes/
cp fuor-termux-them.toml ~/.config/starship.toml
echo 'eval "$(starship init bash)"' >> ~/.bashrc
source ~/.bashrc
```

---

### Method 3: Theme Switcher (recommended)

Add this function to `~/.bashrc` to switch between themes easily:

```bash
stheme() {
    if [ -z "$1" ]; then
        echo "🎨 Available themes:"
        ls ~/.config/starship-themes/ | sed 's/\.toml$//' | sed 's/^/   /'
        return
    fi
    local target=~/.config/starship-themes/$1.toml
    [ -f "$target" ] || { echo "❌ Theme not found: $1"; return 1; }
    cp "$target" ~/.config/starship.toml
    eval "$(starship init bash)"
    echo "✅ Activated: $1"
}
```

Then activate:

```bash
stheme fuor-termux-them
```

---

## 📂 Repository Structure

```
fuor-termux-theme/
├── fuor-termux-them.toml    # Main theme file
├── colors.properties         # Matching terminal colors
├── install.sh                # Auto-installer
├── README.md
├── LICENSE
└── img/
    ├── main.jpg
    ├── main1.jpg
    ├── main2.jpg
    └── main3.jpg
```

---

## 📜 License

This project is licensed under the **MIT License** — see [LICENSE](LICENSE).

---

## 👤 Author

**fuor** (i am seven)

- GitHub: [@izzotv](https://github.com/izzotv)

---

⭐ **If you like this theme, please give it a star!** It means a lot.
