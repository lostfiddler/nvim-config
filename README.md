# fiddlers Neovim config

Requires Neovim version 0.8.0+

## Features
- Plugin management with [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) fuzzy finder
- LSP capabilities managed with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

## Install
1. Clone repository into $MYVIMRC path

> ~/.config (Unix and OSX)
>
> ~/AppData/Local (Windows)
```
git clone https://github.com/lostfiddler/neovim-config.git nvim
```

2. Install [packer.nvim](https://github.com/wbthomason/packer.nvim)

3. Open `lua/lostfiddler/packer.lua` with nvim and run following commands
```
:source
:PackerSync
```

4. Install [servers](https://microsoft.github.io/language-server-protocol/implementors/servers/) for LSP. Type `:help lspconfig` command in nvim for details

- TS, JS, CSS, HTML
```
npm install -g typescript-language-server typescript
```
- go
```
go install golang.org/x/tools/gopls@latest
```
> if on linux/mac, can also use ur ususal package manager
- c
[clangd](https://clangd.llvm.org/installation)
- lua
> windows
```
scoop install lua-language-server
```
> linux/mac
```
brew install lua-language-server
```
- bash
```
npm i -g bash-language-server  
```
