# Environment & dotfiles

Notes & setup guide

## Dependancies
- homebrew [https://brew.sh/]
- ghostty [https://ghostty.org]
- oh my zsh [https://ohmyz.sh/]
- powershell 10k [https://github.com/romkatv/powerlevel10k]
- zsh-autosuggestions [https://github.com/zsh-users/zsh-autosuggestions]
- neovim [https://neovim.io/]
- Go [https://go.dev/]
- Bun [https://bun.sh/]

## Using GNU Stow
Stow works by creating symlinks between a custom folder (dotfiles) in your main directory & the main directory itself. Files created in the dotfiles directory can be symlinked to the the same location in the main directory by running:
`stow .`

## Guide
1. Install homebrew and set up path in ~/.zprofile
2. Install GNU Stow [https://www.gnu.org/software/stow/]
3. Install oh-my-zsh. Install zsh-autosuggestions & powerlevel10k as plugins for oh-my-zsh
4. Install Ghostty
5. Clone this repo into your home directory
6. Remove the existing .zshrc, oh-my-zsh, powerlevel10k folders/files in home directory
7. cd into the dotfiles directory
8. Run `stow .`
