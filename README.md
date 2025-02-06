# Environment & dotfiles

Notes & setup guide for your envinroment

## Dependancies
Use homebrew/brew where possible
- iterm2 [https://iterm2.com/downloads.html]
- powershell 10k [https://github.com/romkatv/powerlevel10k]
- oh my zsh [https://ohmyz.sh/]
- mytils [https://github.com/ytsruh/mytils]
- neovim [https://neovim.io/]
- Go [https://go.dev/]
- Node/NVM [https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating]
- Bun [https://bun.sh/]

## Using GNU Stow
Stow works by creating symlinks between a custom folder (dotfiles) in your main directory & the main directory itself. Files created in the dotfiles directory can be symlinked to the the same location in the main directory by running:
`stow .`

