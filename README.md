# Environment & dotfiles

Notes & setup guide

## Dependancies
- homebrew [https://brew.sh/]
- ghostty [https://ghostty.org]
- neovim [https://neovim.io/]
- Go [https://go.dev/]
- Bun [https://bun.sh/]

## Using GNU Stow
Stow works by creating symlinks between a custom folder (dotfiles) in your main directory & the main directory itself. Files created in the dotfiles directory can be symlinked to the the same location in the main directory by running:
`stow .`

## Guide
1. Install homebrew and set up path in ~/.zprofile
2. Install GNU Stow [https://www.gnu.org/software/stow/]
3. Install Ghostty
4. Clone this repo into your home directory
5. Run `git submodule update --init --recursive` to pull in the git submodules (themes & plugins for ohmyzsh)
6. Remove the existing .zshrc in home directory
7. cd into the dotfiles directory
8. Run `stow .`
