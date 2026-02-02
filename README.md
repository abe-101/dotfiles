# Dotfiles

Personal configs managed with GNU Stow.

## Quick Start
```bash
# Install dependencies
sudo dnf install stow git zsh neovim  # Fedora
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone and setup
git clone git@github.com:abe-101/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .

# Create machine-specific config
cat > ~/.config/zsh/local.zsh << 'CONF'
# Add machine-specific aliases here
CONF
```

## Structure

- `.zshrc` - Shell config (shared)
- `.config/nvim/` - Editor config (shared)
- `.config/zsh/local.zsh` - Machine-specific (gitignored)

## Adding Configs
```bash
mkdir -p .config/kitty
mv ~/.config/kitty/* .config/kitty/
git add .config/kitty
git commit -m "Add kitty"
stow --restow .
```
