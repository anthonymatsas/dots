# dots

My personal configuration files.

## Structure
```
.
├── ghostty/          # ghostty config 
├── iterm2/           # iterm2 configs 
├── nvim/             # Vim/Neovim configs 
├── tmux/             # Terminal multiplexer
└── ...               # Other tools as needed
```

## Installation

Clone the repository:
```bash
git clone https://github.com/anthonymatsas/dots.git ~/.dots
```

Create symlinks as needed:
```bash
ln -s ~/.dots/git/.gitconfig ~/.gitconfig
ln -s ~/.dots/vim/.vimrc ~/.vimrc
# etc...
```

## Notes

- Configs are organized by tool in separate directories
- (opinion) Symlink individual configs rather than using a manager (keeps it simple and explicit)
- Remember to backup existing configs before creating symlinks

## License

Personal use. Feel free to take inspiration.
