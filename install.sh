#!/bin/bash

# install.sh - Installation Script for cmdh

# Ensure script is run with appropriate permissions
if [ "$(id -u)" -ne 0 ] && [ "$1" != "--local" ]; then
  echo "This script requires sudo privileges to install system-wide."
  echo "Run with sudo ./install.sh or use --local flag for local installation."
  echo "Example: sudo ./install.sh   # Install system-wide"
  echo "Example: ./install.sh --local # Install for current user only"
  exit 1
fi

LOCAL_INSTALL=false
if [ "$1" == "--local" ]; then
  LOCAL_INSTALL=true
fi

# Set installation paths
if [ "$LOCAL_INSTALL" = true ]; then
  INSTALL_DIR="$HOME/.local/bin"
  mkdir -p "$INSTALL_DIR"
else
  INSTALL_DIR="/usr/local/bin"
fi

# Copy the script
cp cmdh "$INSTALL_DIR/cmdh"
chmod +x "$INSTALL_DIR/cmdh"

# Check if installation directory is in PATH
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
  if [ "$LOCAL_INSTALL" = true ]; then
    echo "Adding $INSTALL_DIR to your PATH in ~/.bashrc"
    echo "export PATH=\$PATH:$INSTALL_DIR" >> "$HOME/.bashrc"
    echo "You may need to run 'source ~/.bashrc' or restart your terminal."
  else
    echo "Installation directory $INSTALL_DIR should already be in your PATH."
  fi
fi

# Set up configuration
if [ ! -f "$HOME/.cmdh_config" ]; then
  echo "Would you like to set up your Gemini API key now? (y/n)"
  read -r response
  if [[ "$response" =~ ^[Yy] ]]; then
    echo "Please enter your Gemini API key:"
    read -r api_key
    echo "GEMINI_API_KEY=$api_key" > "$HOME/.cmdh_config"
    chmod 600 "$HOME/.cmdh_config"
    echo "API key saved to $HOME/.cmdh_config"
  else
    echo "You can set up your API key later by running 'cmdh -s'"
  fi
fi

echo "Installation complete! Use 'cmdh -h' to see usage instructions."
echo "Example: cmdh -p \"redis commands\""
