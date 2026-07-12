# Dotfiles

My personal dotfiles for my NixOS setup.

## Contents

| Folder | Description |
|--------|-------------|
| `niri/` | Niri Wayland compositor config |
| `kitty/` | Kitty terminal emulator config |
| `btop/` | Btop system monitor theme and layout |
| `fastfetch/` | Fastfetch config and preset |
| `noctalia/` | Noctalia desktop shell config |
| `qt5ct/` | Qt5 theme settings |
| `qt6ct/` | Qt6 theme settings |
| `noctalia-config.toml` | Noctalia main config file |

## Usage

Clone into `~/.config`:

```bash
git clone git@github.com:TheOandO/nixos-dot-files.git ~/.config
```

> **Note:** Fish `config.fish` and GTK themes are managed declaratively via NixOS home-manager and are not included here. See [nixos-config](https://github.com/TheOandO/nixos-config) for the full system configuration.

## Related

- [NixOS Config](https://github.com/TheOandO/nixos-config) — Full NixOS flake configuration
