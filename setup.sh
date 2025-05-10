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
  cp ./helix ~/.config/helix -r
}

install_helix() {
  echo "Installing helix..."
  export RUSTFLAGS="-C target-feature=-crt-static"
  mkdir Tools
  cd Tools
  git clone https://github.com/helix-editor/helix helix-editor
  cd helix-editor
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

install_node() {
  dnf install nodejs
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

check_command() {
  if ! command -v $1 &> /dev/null; then
    echo "$1 not found. Installing..."
    return 1
  else
    echo "$1 is already installed."
    return 0
  fi
}

setup_lsp() {
  echo "Setting up LSPs..."

  # Check if pip is installed
  if check_command pip; then
    python -m pip install -U pyright ruff
  else
    curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
    python -m pip install -U pyright ruff
  fi

  # Clone rust-analyzer repository and install rust-analyzer
  git clone https://github.com/rust-lang/rust-analyzer.git
  cd rust-analyzer

  # Check if cargo-xtask is installed
  if check_command cargo-xtask; then
    cargo xtask install --server
  else
    cargo install cargo-xtask
    cargo xtask install --server
  fi

  # Install global npm packages
  sudo npm i -g \
    @tailwindcss/language-server \
    vscode-langservers-extracted \
    typescript typescript-language-server

  cd -
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
  if [ $# -eq 0 ]; then
    echo "Usage: $0 {install|uninstall|install_rust|install_binstall|setup_helix|install_yazi|install_deno|install_go|install_lazygit|install_node|setup_lsp|all}"
    exit 1
  fi

  for arg in "$@"; do
    case $arg in
      install)
        install_rust
        install_binstall
        setup_helix
        install_yazi
        install_deno
        install_go
        install_lazygit
        install_node
        setup_lsp
        ;;
      uninstall)
        uninstall_all
        ;;
      install_rust)
        install_rust
        ;;
      install_binstall)
        install_binstall
        ;;
      setup_helix)
        setup_helix
        ;;
      install_helix)
        ;;
      install_yazi)
        install_yazi
        ;;
      install_deno)
        install_deno
        ;;
      install_go)
        install_go
        ;;
      install_lazygit)
        install_lazygit
        ;;
      install_node)
        install_node
        ;;
      setup_lsp)
        setup_lsp
        ;;
      all)
        install_go
        install_rust
        install_binstall
        install_helix
        install_yazi
        install_deno
        install_lazygit
        install_node
        setup_helix
        setup_lsp
        ;;
      *)
        echo "Unknown command: $arg"
        echo "Usage: $0 {install|uninstall|install_rust|install_binstall|install_helix|setup_helix|install_yazi|install_deno|install_go|install_lazygit|install_node|setup_lsp|all}"
        ;;
    esac
  done
}

# Execute the main function with all arguments
main "$@"
