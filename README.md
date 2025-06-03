# DITA-OT Dynamic Bash Completion

This directory contains a **smart completion setup script** that automatically discovers DITA-OT installations and sets up intelligent bash completion in a single step.

## 🎯 Quick Start (One Command!)

**Simplest approach** - just run one command and you're done:

```bash
cd completion-scripts
./setup-dita-completion.sh  # Auto-discovers, generates, and installs!
source ~/.bashrc            # Activates completion
```

Test it:
```bash
dita -f <TAB>               # Shows: html5 pdf mobilestrings-cgm xhtml ...
```

## 🔍 **Smart DITA-OT Discovery**

The setup script uses similar logic to the actual `dita` command to find your DITA-OT installation:

1. **Uses `DITA_HOME`** environment variable if set
2. **Uses command line argument** if provided
3. **Auto-discovers** by searching up the directory tree from current location
   - Looks for directories containing both `bin/dita` and `plugins/`
   - Searches current directory, then parent, then grandparent, etc.
   - Stops when it finds a valid DITA-OT or reaches the filesystem root

### Usage Examples

```bash
# Auto-discovery with full setup (recommended):
./setup-dita-completion.sh

# With environment variable:
export DITA_HOME=/path/to/dita-ot
./setup-dita-completion.sh

# With command line argument:
./setup-dita-completion.sh /path/to/dita-ot

# Generate only (no installation):
./setup-dita-completion.sh --generate-only

# Install existing completion:
./setup-dita-completion.sh --install-only

# System-wide installation (requires sudo):
./setup-dita-completion.sh --system-wide
```

## ✨ What You Get

The setup script **automatically discovers** from your DITA-OT installation:
- ✅ **All transformation types** from every installed plugin 
- ✅ **Smart option completion** for DITA-OT command line flags
- ✅ **File completion** for DITA files (`.dita`, `.ditamap`)
- ✅ **Directory completion** for output paths
- ✅ **Property completion** for common DITA-OT properties

### Example Completions
```bash
dita -f <TAB>          # Shows: html5 pdf mobilestrings-cgm xhtml ...
dita -i <TAB>          # Shows: *.dita *.ditamap files
dita -o <TAB>          # Shows: directories
dita -D <TAB>          # Shows: args.input= args.output= clean.temp= ...
```

## 📁 Files in This Directory

- **`setup-dita-completion.sh`** - Main setup script (generates + installs)
- **`dita-completion.bash`** - Generated completion script
- **`README.md`** - This documentation

## 🔧 Advanced Options

### Generate Only (No Installation)
```bash
./setup-dita-completion.sh --generate-only
# Creates dita-completion.bash but doesn't install it
# Useful for inspection or custom installation
```

### Install Only (Skip Generation)
```bash
./setup-dita-completion.sh --install-only
# Installs existing dita-completion.bash
# Useful when you already have a generated script
```

### Help
```bash
./setup-dita-completion.sh --help
# Shows all available options and examples
```

## 🔄 Workflow

The setup script performs these steps in one command:

1. **Discovery Phase**: Searches for DITA-OT installation
2. **Scanning Phase**: Finds all `plugin.xml` files in the plugins directory
3. **Extraction Phase**: Extracts transformation types using simple grep/sed
4. **Generation Phase**: Creates optimized bash completion script
5. **Installation Phase**: Installs to appropriate completion directory

## 🌟 Features

- **One-Command Setup**: Everything happens in a single script execution
- **Zero Configuration**: Works out of the box in most scenarios
- **Portable**: Works on Linux, macOS, and Git Bash on Windows
- **Fast**: Simple grep-based extraction, no XML parsing overhead
- **Reliable**: Robust error handling and validation
- **Smart**: Uses the same discovery logic as DITA-OT itself
- **Flexible**: Options for generate-only or install-only workflows

## 🛠️ Troubleshooting

**If auto-discovery fails:**
1. Make sure you're running from within or below a DITA-OT installation
2. Check that your DITA-OT has both `bin/dita` and `plugins/` directory
3. Set `DITA_HOME` manually: `export DITA_HOME=/path/to/dita-ot`
4. Use explicit path: `./setup-dita-completion.sh /path/to/dita-ot`

**If completion doesn't work after installation:**
```bash
# Check if completion is registered
complete -p dita

# Manually activate completion
source ~/.bash_completion.d/dita

# Or reload your bash configuration
source ~/.bashrc
```

**For help:**
```bash
./setup-dita-completion.sh --help
```

## 🔄 When to Re-run

Re-run the setup script when you:
- Install new DITA-OT plugins
- Update existing plugins  
- Change DITA-OT installation
- Want to refresh completion with latest plugin changes

Simply run:
```bash
./setup-dita-completion.sh  # Regenerates and reinstalls everything
```

## 🎉 Example Output

```
🔍 DITA_HOME not set, searching for DITA-OT installation...
  Checking: /path/to/current/directory
  Checking: /path/to/parent/directory
✓ Found DITA-OT at: /path/to/dita-ot

🔍 DITA-OT Completion Generator
===============================
✓ DITA-OT: /path/to/dita-ot
📊 Scanning for transtypes...
Found transtypes: html5 pdf xhtml mobilestrings-cgm ...
✓ Generated completion script: dita-completion.bash
✓ Discovered 22 transtypes from 26 plugins

🔧 Installing DITA-OT Completion
=================================
Source: /path/to/dita-completion.bash
Target: /home/user/.bash_completion.d/dita
✓ Installed completion script

🎉 DITA-OT completion setup complete!

To activate:
  source ~/.bashrc

Test it:
  dita -f <TAB>          # Shows all transtypes
```

The setup script makes DITA-OT completion accessible to everyone - just one command and you're ready to go! 🚀 

## 🔧 Installation Options

### User-Local Installation (Default)
```bash
./setup-dita-completion.sh
# Installs to: ~/.local/share/bash-completion/completions/dita
# Available only for the current user
# No sudo required
```

### System-Wide Installation
```bash
./setup-dita-completion.sh --system-wide
# Installs to: /usr/share/bash-completion/completions/dita
# Available for all users on the system
# Requires sudo privileges
```

### Git Bash (Windows)
```bash
./setup-dita-completion.sh
# Installs to: $MINGW_PREFIX/etc/bash_completion.d/dita
# Works automatically in Git Bash environment
```

## 🐚 Shell Compatibility

**✅ Supported:**
- **Bash** (primary target) - Full completion support
- **Git Bash** (Windows) - Full completion support

**❌ Not Supported:**
- **Zsh** - Would need different completion syntax
- **Fish** - Would need complete rewrite
- **PowerShell** - Different completion system
- **Cmd** - No completion support

**Note**: This is a bash-specific completion script. For other shells, you would need shell-specific completion scripts with different syntax and approaches. 