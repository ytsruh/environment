# Environment & dotfiles

Notes & setup guide for your envinroment

## Dependancies
Use homebrew/brew where possible
- iterm2(install)[https://iterm2.com/downloads.html]
- powershell 10k(install)[https://github.com/romkatv/powerlevel10k]
- oh my zsh(install)[https://ohmyz.sh/]
- mytils(install)[https://github.com/ytsruh/mytils]
- neovim(install)[https://neovim.io/]
- Go(install)[https://go.dev/]
- Node/NVM(install)[https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating]

## Using GNU Stow
Stow works by creating symlinks between a custom folder (dotfiles) in your main directory & the main directory itself. Files created in the dotfiles directory can be symlinked to the the same location in the main directory by running:
`stow .`

