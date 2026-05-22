# neovim-for-newbs

A Neovim config built for people who are new to Neovim. Every decision
prioritizes discoverability and ease of use: sane defaults out of the box,
`<Space>` as leader so keybindings are easy to reach, **which-key** to show
available commands as you type, and no cryptic Vimscript — everything is plain
Lua you can read and modify. If Neovim has ever felt overwhelming, this config
is the on-ramp.

## Features

- **Carbonfox** colorscheme — high-contrast dark theme
- **Lualine** statusline with powerline separators
- **LSP** via lsp-zero + Mason (auto-installs beginner defaults for Lua, JS/TS, Python, Bash, and JSON)
- **Treesitter** syntax highlighting with auto-install
- **Telescope** fuzzy finder for files, grep, and history
- **Neo-tree** beginner file explorer + **Oil** native directory editor
- **nvim-cmp** autocompletion with snippets (LuaSnip + friendly-snippets)
- **Gitsigns** inline git blame and hunk preview
- **vim-fugitive** Git commands
- **which-key** keybinding discovery
- **nvim-autopairs** bracket auto-close
- **indent-blankline** visual indent guides
- **todo-comments** highlighted TODO/FIXME/NOTE tags
- **nvim-tmux-navigation** seamless pane navigation
- **none-ls** formatting (black, prettier, shfmt, stylua) + markdownlint
- **vim-test** + vimux test runner

## Requirements

- Neovim >= 0.10
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons and powerline glyphs
- Node.js (for prettier, swagger-preview)
- `cmake` (for telescope-fzf-native)

## Installation

```bash
git clone https://github.com/keegoid/neovim-for-newbs ~/.config/nvim
nvim
```

Lazy.nvim will bootstrap itself and install all plugins on first launch.

---

## Getting Started

### Understanding Vim Modes

Neovim is modal — the same keys do different things depending on the current
mode. This is the key concept that makes Neovim so powerful once it clicks.

| Mode | How to enter | What it's for |
|------|-------------|---------------|
| **Normal** | `Esc` or `jk` | Moving around, running commands. This is home base. |
| **Insert** | `i` | Typing text like a normal editor |
| **Visual** | `v` | Selecting text |
| **Command** | `:` | Running editor commands (save, quit, etc.) |

> **Tip:** When in doubt, press `Esc` (or `jk`) to get back to Normal mode.

### Your First Moves

1. Open a file: `nvim myfile.lua`
2. Press `i` to start typing
3. Press `jk` or `Esc` to stop typing
4. Press `Ctrl+S` to save
5. Press `<Space>` and wait — **which-key** will show all available commands
6. Run `:NewbsHelp` any time you want the built-in beginner cheat sheet

---

## Key Mappings

Leader key is `<Space>`. Press `<Space>` in Normal mode and pause — which-key
will pop up a menu showing every available command.

### Saving & Quitting

| Key | Action |
|-----|--------|
| `Ctrl+S` | Save file (works in Normal and Insert mode) |
| `<Space>ww` | Save / Save As (prompts for name if new file) |
| `<Space>wq` | Save and quit |
| `<Space>qq` | Quit |
| `<Space>qf` | Force quit without saving |

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+P` | Find and open any file by name |
| `<Space>ff` | Find and open any file by name |
| `<Space><Space>` | Reopen a recently used file |
| `<Space>fr` | Reopen a recently used file |
| `<Space>fg` | Search for text across all files (live grep) |
| `<Space>ef` | Toggle file explorer sidebar |
| `<Space>eb` | Browse open buffers (tabs) |
| `<Space>eo` | Open Oil directory editor |
| `-` | Open Oil for the parent directory |
| `<C-h/j/k/l>` | Move between splits or tmux panes |

### Editing

| Key | Action |
|-----|--------|
| `jk` | Exit Insert mode (faster than reaching for Esc) |
| `gc` + motion | Toggle comments (`gcc` = comment current line) |
| `<Space>li` / `<Space>i` | Auto-format the current file |
| `<Space>y` | Copy selection to system clipboard |
| `<Space>p` | Paste from system clipboard |

### LSP (Code Intelligence)

These work when a language server is active (auto-installs via Mason).

| Key | Action |
|-----|--------|
| `K` | Show docs for symbol under cursor |
| `gd` / `<Space>ld` | Go to definition |
| `gr` / `<Space>lr` | Show all references |
| `<Space>lh` | Show docs for symbol under cursor |
| `<Space>la` | Code actions (quick fixes, imports, etc.) |
| `<Space>le` | Show diagnostic under cursor |
| `<Space>ln` / `<Space>lp` | Next / previous diagnostic |
| `<Space>ll` | List diagnostics |

### Git

| Key | Action |
|-----|--------|
| `<Space>gp` | Preview the current git hunk (change) |
| `<Space>gb` / `<Space>gt` | Toggle inline git blame for current line |

### Search

| Key | Action |
|-----|--------|
| `/` | Search forward in file |
| `n` / `N` | Next / previous match |
| `<Space>h` | Clear search highlight |
| `<Space>ft` | Find all TODOs/FIXMEs across project |

### Tests

| Key | Action |
|-----|--------|
| `<Space>tt` | Run test nearest to cursor |
| `<Space>tT` | Run all tests in current file |
| `<Space>ta` | Run entire test suite |
| `<Space>tl` | Re-run last test |

### System

| Key | Action |
|-----|--------|
| `<Space>sl` | Open Lazy plugin manager (install/update/remove) |
| `<Space>sh` | Run `:checkhealth` (diagnose config issues) |
| `<Space>sH` | Open the built-in beginner help |
| `<Space>sk` | Show the which-key keymap menu |
| `<Space>so` | Open a throwaway Oil practice directory |
| `<Space>a` | Return to dashboard |

---

## Neo-tree vs Oil

This config keeps both, but gives them different jobs:

- **Neo-tree** (`<Space>ef`) is the default beginner file explorer. It behaves
  like a familiar sidebar: browse folders, open files, inspect buffers, and
  view git changes.
- **Oil** (`-` or `<Space>eo`) is the native Neovim file editor. It opens a
  directory as a normal editable buffer: rename a file by editing its line,
  create a file by adding a line, delete a file by deleting its line, then
  save with `:w` to apply the filesystem changes.

Try Oil safely:

```vim
:NewbsOilLab
```

Inside Oil, press `g?` for help, `<CR>` to open a file/directory, `-` to go to
the parent directory, `g.` to show hidden files, `<C-p>` to preview, `:w` to
apply changes, and `:q!` to discard pending directory edits.

## Built-in Help

| Command | Action |
|---------|--------|
| `:NewbsHelp` | Open the built-in beginner help |
| `:NewbsKeys` | Show the which-key keymap menu |
| `:NewbsOilLab` | Create/open a throwaway Oil practice directory |
| `:help neovim-for-newbs` | Open the standard Neovim help page |

## Tips

- **Mouse works** — click to move cursor, scroll to scroll, drag to resize splits
- **Autocompletion** appears automatically while typing; `Enter` accepts, `Esc` dismisses
- **Brackets auto-close** — type `(` and `)` appears automatically
- **TODOs are highlighted** — write `-- TODO:` or `-- FIXME:` and they glow
- **Indent guides** show code structure at a glance
- **Relative line numbers** make jumping easy: `5j` jumps down 5 lines

## License

MIT
