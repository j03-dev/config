#!/usr/bin/env bash

install_rust() {
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source ~/.config/fish/config.fish
}

install_binstall() {
  echo "Installing cargo-binstall and essential packages..."
  cargo install cargo-binstall
  cargo binstall zellij -y
  cargo binstall zoxide -y
  cargo binstall starship -y
  cp ./zellij ~/.config/ -r
}

setup_helix() {
  echo "Setting up Helix editor..."
  cp ./hx ~/.config/helix -r
  export RUSTFLAGS="-C target-feature=-crt-static"
  mkdir Tools
  cd Tools
  git clone https://github.com/helix-editor/helix
  cd helix
  cargo install --path helix-term --locked
  ln -Ts $PWD/runtime ~/.config/helix/runtime
  cd ../..
}

install_yazi() {
  echo "Installing yazi..."
  cargo install --locked --git https://github.com/sxyazi/yazi.git yazi-fm yazi-cli
}

install_deno() {
  echo "Installing Deno..."
  curl -fsSL https://deno.land/install.sh | sh
}

install_go() {
  echo "Installing Go..."
  wget https://go.dev/dl/go1.23.2.linux-amd64.tar.gz
  tar -C ~/.local -xzf go1.23.2.linux-amd64.tar.gz
  echo 'export PATH="$PATH:~/.local/go/bin"' >> ~/.config/fish/config.fish
  source ~/.config/fish/config.fish
}

install_lazygit() {
  echo "Installing LazyGit..."
  go install github.com/jesseduffield/lazygit@latest
}

setup_lsp() {
  echo "Setting up LSPs..."
  curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  python get-pip.py
  python -m pip install pyright ruff
  git clone https://github.com/rust-lang/rust-analyzer.git && cd rust-analyzer
  cargo install cargo-xtask
  cargo xtask install --server
  cd -
  deno install -g npm:tailwindcss-language-server
  deno install -g npm:vscode-langservers-extracted
}

uninstall_all() {
  echo "Uninstalling everything..."

  # Uninstall Rust-related
  rustup self uninstall -y
  cargo uninstall cargo-binstall zellij zoxide helix-term yazi yazi-fm yazi-cli cargo-xtask

  # Remove directories
  rm -rf ~/.config/zellij ~/.config/helix ~/.config/fish/config.fish

  # Uninstall Deno
  rm -rf ~/.deno

  # Uninstall Go
  rm -rf ~/.local/go

  # Uninstall LazyGit
  rm -rf ~/.local/bin/lazygit

  # Cleanup LSP
  rm -rf rust-analyzer
  pip uninstall pyright ruff -y
  deno uninstall tailwindcss-language-server vscode-html-language-server
}

main() {
  install_rust
  install_binstall
  setup_helix
  install_yazi
  install_deno
  install_go
  install_lazygit
  setup_lsp
}

# Check arguments for uninstall
if [ "$1" == "uninstall" ]; then
  uninstall_all
else
  main
fi
