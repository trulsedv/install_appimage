# install_appimage

A simple script to install AppImage applications on Linux.

## Prerequisites

The script needs the AppImage and a PNG icon placed in `~/Downloads` and named like this:

- `{app_name}.AppImage` — the AppImage file
- `{app_name}.png` — the application icon

## What it does

- Moves an AppImage and its icon from `~/Downloads` to the appropriate directories
    - `~/.local/bin`
    - `~/.local/share/icons/apps`
- Makes the AppImage executable
- Creates a `.desktop` entry so the app appears in your application launcher

## Usage

Make the script executable either by the command below, or right clicking the script file selecting "Properties" then togling "Executable as Program".

```bash
chmod +x install_appimage.sh
```

Run the program either by the command below, or right clicking the script file and pressing "Run as a Program".

```bash
install_appimage.sh
```