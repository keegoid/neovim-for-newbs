# neovim-for-newbs

A Neovim config for people who are new to Neovim but still want to learn the
real editor. It keeps normal Neovim habits intact, then adds discoverable
shortcuts, a dashboard, built-in help, sane defaults, and common tools for code,
files, search, git, tests, and formatting.

The main rule: press `<Space>` in Normal mode and pause. which-key will show
what you can do next.

## Requirements

- Neovim >= 0.11
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for icons
- `rg` / ripgrep for project text search
- `cmake` and local build tools for `telescope-fzf-native`
- Node.js + npm for Swagger preview and JavaScript tooling

Optional but useful:

- `tmux` for the Vimux-backed test runner
- Formatters: `black`, `prettier`, `shfmt`, `stylua`
- `markdownlint` if you want markdown diagnostics

## Installation

```bash
git clone https://github.com/keegoid/neovim-for-newbs ~/.config/nvim
nvim
```

Lazy.nvim bootstraps itself and installs plugins on first launch.

## First Launch

You should land on the Alpha dashboard. The dashboard lists common actions with
visible shortcuts. `SPC` means the spacebar.

Useful first commands:

| Key or command | Action |
| --- | --- |
| `<Space>` then pause | Show the available keymap menu |
| `<Space>a` | Return to the dashboard |
| `<Space>sH` | Open the built-in beginner help |
| `<Space>sk` | Show the keymap menu directly |
| `<Space>sl` | Open Lazy plugin manager |
| `<Space>sh` | Run `:checkhealth` |

Standard Neovim help also works:

```vim
:help neovim-for-newbs
```

## First Edit

1. Open a file: `nvim myfile.lua`
2. Press `i` to enter Insert mode and type text.
3. Press `jk` or `Esc` to return to Normal mode.
4. Press `Ctrl+S` to save.
5. Press `<Space>ff` or `Ctrl+P` to find another file.
6. Press `<Space>qq` to quit.

## Modes

Neovim is modal. The same key can do different things depending on mode.

| Mode | Enter with | Use it for |
| --- | --- | --- |
| Normal | `Esc` or `jk` | Moving, editing, commands. This is home base. |
| Insert | `i` | Typing text |
| Visual | `v` | Selecting text |
| Command | `:` | Running commands like `:w`, `:q`, and `:help` |

When in doubt, press `Esc` or `jk` to return to Normal mode.

## Everyday Workflow

### Files And Search

| Key | Action |
| --- | --- |
| `Ctrl+P` / `<Space>ff` | Find files |
| `<Space>fr` / `<Space><Space>` | Recent files |
| `<Space>fg` | Search text across the project |
| `<Space>fb` | Browse open buffers |
| `<Space>ft` | Find TODO/FIXME comments |

### Saving And Quitting

| Key | Action |
| --- | --- |
| `Ctrl+S` | Save in Normal or Insert mode |
| `<Space>ww` | Save, prompting for a filename when needed |
| `<Space>wq` | Save and quit |
| `<Space>qq` | Quit |
| `<Space>qf` | Force quit without saving |

### Editing

| Key | Action |
| --- | --- |
| `jk` | Exit Insert mode |
| `gc` + motion | Toggle comments (`gcc` comments a line) |
| `<Space>li` / `<Space>i` | Format the current file |
| `<Space>y` | Copy visual selection to the system clipboard |
| `<Space>p` | Paste from the system clipboard |
| `<Space>h` | Clear search highlight |

### Code Intelligence

These work when a language server is active. Mason installs beginner defaults
for Lua, JavaScript/TypeScript, Python, Bash, and JSON.

| Key | Action |
| --- | --- |
| `K` / `<Space>lh` | Hover documentation |
| `gd` / `<Space>ld` | Go to definition |
| `gr` / `<Space>lr` | Find references |
| `<Space>la` | Code action |
| `<Space>le` | Show diagnostic under cursor |
| `<Space>ln` / `<Space>lp` | Next / previous diagnostic |
| `<Space>ll` | List diagnostics |

### Filesystem Tools

This config includes both Neo-tree and Oil because they teach different habits.

| Key | Action |
| --- | --- |
| `<Space>ef` | Toggle Neo-tree file explorer |
| `<Space>eb` | Browse open buffers in Neo-tree |
| `<Space>eg` | Browse git changes in Neo-tree |
| `<Space>eo` | Open Oil directory editor |
| `-` | Open Oil for the parent directory |
| `<Space>so` | Open a safe Oil practice directory |

Neo-tree is the familiar sidebar. Oil is a native Neovim directory editor:
rename a file by editing its line, create a file by adding a line, delete a file
by deleting its line, then save with `:w` to apply the filesystem changes.

To try Oil safely:

```vim
:NewbsOilLab
```

Inside Oil, press `g?` for help, `<CR>` to open a file or directory, `-` to go
up, `g.` to show hidden files, `<C-p>` to preview, `:w` to apply changes, and
`:q!` to discard pending directory edits.

### Git

| Key | Action |
| --- | --- |
| `<Space>gp` | Preview the current git hunk |
| `<Space>gb` / `<Space>gt` | Toggle inline blame for the current line |

### Tests

| Key | Action |
| --- | --- |
| `<Space>tt` | Run nearest test |
| `<Space>tT` | Run tests in the current file |
| `<Space>ta` | Run the test suite |
| `<Space>tl` | Re-run the last test |
| `<Space>tg` | Open the last test output |

### Panes

| Key | Action |
| --- | --- |
| `<C-h>` | Move to the left split or tmux pane |
| `<C-j>` | Move to the lower split or tmux pane |
| `<C-k>` | Move to the upper split or tmux pane |
| `<C-l>` | Move to the right split or tmux pane |

## Built-In Help

| Command | Action |
| --- | --- |
| `:NewbsHelp` | Open the beginner help page |
| `:NewbsKeys` | Show the keymap menu |
| `:NewbsOilLab` | Create/open a throwaway Oil practice directory |
| `:help neovim-for-newbs` | Open the standard Neovim help page |

## Defaults Worth Knowing

- Mouse support is on.
- Line numbers and relative line numbers are on.
- System clipboard integration is on.
- Persistent undo is on.
- Search ignores case until you type an uppercase letter.
- New splits open right and below.
- Substitutions preview before you confirm them.
- Brackets auto-close.
- TODO, FIXME, and NOTE comments are highlighted.

## Plugin Inventory

- **alpha-nvim** dashboard
- **which-key** keybinding discovery
- **nightfox** Carbonfox colorscheme
- **lualine** clean statusline
- **Telescope** files, grep, buffers, and history
- **Neo-tree** sidebar file explorer
- **Oil** editable directory buffers
- **lsp-zero**, **Mason**, and **nvim-lspconfig** language servers
- **nvim-cmp** completion with **LuaSnip** snippets
- **nvim-treesitter** syntax highlighting and indentation
- **none-ls** formatting with installed external tools
- **gitsigns** git hunks and blame
- **vim-fugitive** Git commands
- **nvim-autopairs** bracket pairs
- **indent-blankline** indentation guides
- **todo-comments** highlighted TODO/FIXME/NOTE comments
- **nvim-tmux-navigation** split/tmux movement
- **vim-test** + **vimux** test runner
- **swagger-preview** OpenAPI preview support

## Maintenance

Use `<Space>sl` to open Lazy, then press:

| Lazy key | Action |
| --- | --- |
| `U` | Update plugins |
| `S` | Sync plugins |
| `C` | Check plugin health |
| `?` | Lazy help |

Use `<Space>sh` or `:checkhealth` when something feels off. Some health
warnings are optional language ecosystems; for example, PHP, Composer, or Julia
warnings only matter if you plan to use those tools.

## License

MIT
