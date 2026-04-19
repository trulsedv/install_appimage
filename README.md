# install_appimage

A simple script to install AppImage applications on Linux.

## What it does

- Moves an AppImage and its icon from `~/Downloads` to the appropriate directories
- Makes the AppImage executable
- Creates a `.desktop` entry so the app appears in your application launcher

## Prerequisites

Before running the script, place the following files in `~/Downloads`:

- `{app_name}.AppImage` — the AppImage file
- `{app_name}.png` — the application icon

## Usage

Make the script executable either by the command below, or by togling the properiy in the file properties.

```bash
chmod +x install_appimage.sh
```

Run the program either by the command below or double clicking the script file.

```bash
install_appimage.sh
```