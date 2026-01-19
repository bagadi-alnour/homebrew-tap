# Homebrew Tap for Todo CLI

This is a Homebrew tap for [todo-cli](https://github.com/bagadi-alnour/todo-cli) - a project-embedded interactive todo system for developers.

## Installation

```bash
brew tap bagadi-alnour/tap
brew install todo
```

Or install directly:

```bash
brew install bagadi-alnour/tap/todo
```

## Usage

```bash
# Initialize a todo project
todo init

# Add a todo
todo add "Fix authentication bug" --path src/auth

# List todos interactively
todo list

# Start web UI
todo ui
```

## Updating

```bash
brew update
brew upgrade todo
```

## Uninstalling

```bash
brew uninstall todo
brew untap bagadi-alnour/tap
```

## More Information

See the main repository for full documentation: https://github.com/bagadi-alnour/todo-cli
