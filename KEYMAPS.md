# Neovim Keymap Cheatsheet

**Leader = `Space`**

## Finding keys from inside Neovim

| Key | What it does |
| --- | --- |
| `Space` *(then wait)* | **which-key** popup with every leader key, grouped |
| `g`, `[`, `]`, `z`, `"`, `` ` `` *(then wait)* | which-key also lists keys under these prefixes |
| `<leader>?` | Keys set only for the current buffer (Rust, LSP, git, …) |
| `<leader>pk` | Fuzzy-search **every** keymap (Telescope) |
| `<leader>vk` | Open this cheatsheet in a split |

---

## Files and navigation

| Key | What it does |
| --- | --- |
| `<leader>pv` or `-` | File explorer (Oil): edit the directory like a text buffer, `:w` to apply |
| `<C-p>` | Find git-tracked files |
| `<leader>pf` | Find files |
| `<leader>pr` | Recent files |
| `<leader>pb` | Open buffers |
| `<leader>pg` | Live grep (search as you type) |
| `<leader>ps` | Grep for a string (prompts) |
| `<leader>pws` / `<leader>pWs` | Grep word / WORD under cursor |
| `<leader>pd` | Diagnostics picker |
| `<leader>vh` | Search `:help` |

**Inside Telescope:** `<C-n>`/`<C-p>` move · `<CR>` open · `<C-x>` split · `<C-v>` vsplit · `<C-q>` send to quickfix · `<Esc>` close

**Inside Oil:** `<CR>` open · `-` parent dir · `_` cwd · `<C-s>` vsplit · `<C-x>` split · `<C-p>` preview · `g.` toggle hidden files · `g?` help

### Harpoon (pinned files)

| Key | What it does |
| --- | --- |
| `<leader>a` | Pin current file |
| `<C-e>` | Harpoon menu (reorder/delete like normal text) |
| `<leader>h` `<leader>j` `<leader>k` `<leader>l` | Jump to pinned file 1 / 2 / 3 / 4 |
| `<leader>c` | Clear all pins |

### Windows

| Key | What it does |
| --- | --- |
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move to the window left / down / up / right |
| `<C-w>v` / `<C-w>s` | Split vertically / horizontally *(built-in)* |
| `<C-w>q` | Close window *(built-in)* |

---

## Editing

| Key | What it does |
| --- | --- |
| `J` / `K` *(visual)* | Move selected lines down / up |
| `J` | Join lines (cursor stays put) |
| `<C-d>` / `<C-u>` | Half page down / up, centered |
| `n` / `N` | Next / prev search match, centered |
| `<leader>s` | Substitute the word under the cursor everywhere |
| `<leader>y` / `<leader>Y` | Yank to system clipboard (selection / line) |
| `<leader>d` | Delete without overwriting the yank register |
| `<C-a>` | Select all |
| `<C-c>` *(insert)* | Escape |
| `<leader>f` | Format buffer (Rust also formats on save) |
| `<leader>u` | Undo tree |
| `gcc` / `gc` *(visual)* | Toggle comment *(built-in)* |
| `an` / `in` *(visual)* | Expand / shrink selection by syntax node *(built-in)* |
| `<leader><leader>` | Source current file (handy when editing this config) |
| `<leader>x` | `chmod +x` current file |

### Completion (insert mode)

| Key | What it does |
| --- | --- |
| `<C-n>` / `<C-p>` | Next / prev suggestion |
| `<Tab>` | Accept suggestion |
| `<C-Space>` | Open the completion menu |
| `<C-e>` | Close the menu |
| `<C-b>` / `<C-f>` | Scroll the docs window |
| `<C-s>;` / `<C-s>,` | Snippet: next / prev field |
| `<C-s>e` | Snippet: expand |

---

## LSP (any language with a server)

| Key | What it does |
| --- | --- |
| `K` | Hover docs (press twice to jump into the window) |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gy` | Go to type definition |
| `<C-h>` *(insert)* | Signature help |
| `<leader>vca` | Code action |
| `<leader>vrn` | Rename symbol |
| `<leader>vrr` | References |
| `<leader>vrs` | Restart language server |
| `<leader>vws` | Workspace symbols |
| `<leader>vd` | Show diagnostics for the line |
| `<leader>vi` | Toggle inlay hints (type hints) |
| `]d` / `[d` | Next / prev diagnostic |

*Built-in alternatives: `grn` rename · `gra` code action · `grr` references · `gri` implementation · `gO` document symbols.*

### Trouble (diagnostics list)

| Key | What it does |
| --- | --- |
| `<leader>tt` | Workspace diagnostics |
| `<leader>tb` | Buffer diagnostics |
| `<leader>ts` | Symbols outline |
| `<leader>tq` | Quickfix list |
| `]t` / `[t` | Next / prev item |

---

## 🦀 Rust

These keys only exist in `.rs` files.

| Key | What it does |
| --- | --- |
| `K` | Hover **with actions** (go to impl, run, debug…) |
| `<leader>vca` | Rust-aware code actions (grouped) |
| `<leader>rr` | Pick something to run (`cargo run`, a binary, an example…) |
| `<leader>rl` | Re-run the last runnable |
| `<leader>rt` | Pick a test to run |
| `<leader>re` | Expand macro under cursor |
| `<leader>rx` | Explain error code (`rustc --explain`) |
| `<leader>rd` | Show the full compiler diagnostic, like `cargo build` prints it |
| `<leader>rc` | Open `Cargo.toml` |
| `<leader>rp` | Go to parent module |
| `<leader>rD` | Open docs.rs for the symbol under cursor |
| `<leader>rj` | Smart join lines |
| `<leader>rm` / `<leader>rM` | Move item (fn, struct, …) down / up |

In **`Cargo.toml`**:

| Key | What it does |
| --- | --- |
| `K` | Crate versions / info |
| `<leader>rv` | Versions popup |
| `<leader>rf` | Features popup |
| `<leader>ru` | Upgrade crate under cursor |
| `<leader>rU` | Upgrade all crates |
| `<leader>rD` | Open the crate's docs |
| `<leader>vca` | Crate code actions |

Saving a `.rs` file runs **rustfmt** and **clippy**. Clippy warnings show up as diagnostics.

---

## Git

| Key | What it does |
| --- | --- |
| `]h` / `[h` | Next / prev changed hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gs` | Stage / unstage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gb` | Blame line |
| `<leader>gd` | Diff file |

---

## Useful commands

| Command | What it does |
| --- | --- |
| `:Lazy` | Plugin manager (`U` update, `S` sync) |
| `:Mason` | Install language servers / tools |
| `:TSUpdate` | Update treesitter parsers |
| `:RustLsp …` | All Rust commands (tab-complete them) |
| `:ConformInfo` | Which formatter runs for this file |
| `:checkhealth` | Diagnose problems |
| `<leader>mr` | Make it rain 🌧️ |
