# Newbs Nvim Onboarding Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make this Neovim config more discoverable, safer, and easier for new users while keeping accepted Neovim conventions available.

**Architecture:** Keep the config lightweight and Lua-native. Add focused helpers only where they make repeated concepts clearer: beginner help lives in `lua/newbs/help.lua`, runtime help lives in `doc/neovim-for-newbs.txt`, and smoke verification lives in `scripts/smoke.lua`.

**Tech Stack:** Neovim Lua config, lazy.nvim, which-key.nvim, alpha-nvim, lsp-zero, Mason, Neo-tree, Oil, Stylua.

---

### Task 1: Normalize Keymaps And Which-Key Groups

**Files:**
- Modify: `lua/keymaps.lua`
- Modify: `lua/plugins/which-key.lua`
- Modify: plugin files that define keymaps

- [ ] Convert command mappings from raw `:command<CR>` strings to `<cmd>command<cr>`.
- [ ] Add `desc` to every user-facing mapping.
- [ ] Add `silent = true` to command mappings that should not echo into the command line.
- [ ] Rework which-key groups to simple beginner labels: `find`, `explorer`, `git`, `code`, `test`, `write`, `quit`, `system`.
- [ ] Verify with `nvim --headless` that representative mappings exist and include descriptions.

### Task 2: Improve Defaults

**Files:**
- Modify: `lua/vim-options.lua`

- [ ] Add safer defaults: `confirm`, `undofile`, `ignorecase`, `smartcase`, `splitright`, `splitbelow`, `inccommand = "split"`.
- [ ] Keep beginner-friendly defaults already present: mouse, line numbers, relative numbers, cursorline, signcolumn, system clipboard.
- [ ] Verify startup still succeeds headlessly.

### Task 3: Upgrade Dashboard

**Files:**
- Modify: `lua/plugins/alpha.lua`

- [ ] Keep the existing custom header.
- [ ] Add dashboard buttons for new file, find file, recent files, file explorer, Oil file editor, live grep, keymap help, health check, Lazy, and quit.
- [ ] Keep `<leader>a` silent and command-form.
- [ ] Verify `:Alpha` loads headlessly.

### Task 4: Improve LSP And Diagnostics

**Files:**
- Modify: `lua/plugins/lsp-zero.lua`

- [ ] Configure a small beginner default server set: Lua, TypeScript/JavaScript, Python, Bash, JSON.
- [ ] Keep default LSP mappings and add described beginner mappings under `<leader>l`.
- [ ] Add diagnostic mappings for show error, next, previous, and list diagnostics.
- [ ] Verify the LSP config loads headlessly without requiring installed servers during startup.

### Task 5: Keep Neo-Tree Primary And Oil Secondary

**Files:**
- Modify: `lua/plugins/neo-tree.lua`
- Modify: `lua/plugins/oil.lua`

- [ ] Keep Neo-tree as the beginner default sidebar.
- [ ] Keep Oil as the native file-editor workflow on `-` and `<leader>eo`.
- [ ] Configure Oil to send deletes to trash when available and show a clear mapping description.
- [ ] Document the comparison and test lab in the README.

### Task 6: Add In-Editor Help

**Files:**
- Create: `lua/newbs/help.lua`
- Create: `doc/neovim-for-newbs.txt`
- Modify: `init.lua`
- Modify: `lua/plugins/which-key.lua`

- [ ] Add `:NewbsHelp`, `:NewbsKeys`, and `:NewbsOilLab` commands.
- [ ] Add a real Neovim help file available through `:help neovim-for-newbs`.
- [ ] Add which-key entries for beginner help.
- [ ] Verify commands exist in headless Neovim.

### Task 7: Add Smoke Checks

**Files:**
- Create: `scripts/smoke.lua`

- [ ] Assert startup loaded.
- [ ] Assert important mappings exist with descriptions.
- [ ] Assert beginner commands exist.
- [ ] Assert Alpha, Neo-tree, Oil, Telescope, and which-key commands/modules are loadable.
- [ ] Run the smoke script headlessly.

### Task 8: Update README

**Files:**
- Modify: `README.md`

- [ ] Update keymap tables to match the final config.
- [ ] Add the Neo-tree vs Oil comparison and Oil lab.
- [ ] Add in-editor help commands.
- [ ] Align LSP language-server wording with the actual default server set.

### Task 9: Format And Verify

**Files:**
- All modified Lua files.

- [ ] Run `stylua .`.
- [ ] Run `stylua --check .`.
- [ ] Run `nvim --headless --cmd 'set shadafile=NONE' +'luafile scripts/smoke.lua' +qa` with temp state/cache.
- [ ] Review `git diff`.
