# cmd-help (cmdh)

A terminal utility that helps you remember useful commands using Gemini AI.

## Overview

`cmdh` is a command-line tool that helps users remember terminal commands without having to search the web. Just describe what you're trying to do, and the tool will suggest the appropriate commands.

## Features

- Query for terminal commands using natural language
- Get concise command suggestions or verbose explanations
- Copy commands directly to clipboard
- Easy installation and configuration

## Requirements

- Bash shell
- curl
- A Gemini API key (get one from [Google AI Studio](https://aistudio.google.com/))
- Optional: xclip (Linux) or pbcopy (macOS) for clipboard functionality

## Installation

### Automatic Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/cmd-help.git
cd cmd-help

# Install system-wide (requires sudo)
sudo ./install.sh

# OR install for current user only
./install.sh --local
```

### Manual Installation

1. Download the `cmdh` script
2. Make it executable: `chmod +x cmdh`
3. Move it to a directory in your PATH: `sudo mv cmdh /usr/local/bin/` (system-wide) or `mv cmdh ~/.local/bin/` (user only)

## Configuration

Set up your Gemini API key:

```bash
cmdh -s
```

Or manually create a configuration file:

```bash
echo "GEMINI_API_KEY=your_api_key_here" > ~/.cmdh_config
chmod 600 ~/.cmdh_config
```

## Usage

```bash
cmdh -p "your query here"    # Basic usage
cmdh -v -p "your query here" # Verbose mode with explanations
cmdh -c -p "your query here" # Copy result to clipboard
```

### Examples

```bash
cmdh -p "redis commands"
cmdh -p "how to find large files"
cmdh -v -p "set up a python virtual environment"
cmdh -c -p "docker compose commands"
```

## Options

- `-h, --help`: Show help message
- `-p, --prompt`: Specify the query
- `-v, --verbose`: Show detailed responses with explanations
- `-c, --copy`: Copy the commands to clipboard
- `-s, --setup`: Configure API key and settings

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## License

MIT License - See LICENSE file for details.
