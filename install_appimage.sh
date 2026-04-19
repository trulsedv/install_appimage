#!/bin/bash

set -e
trap 'echo "An error occurred. Press Enter to close."; read' ERR

echo "Please ensure the AppImage and PNG icon are named {app_name}.AppImage and {app_name}.png and located in ~/Downloads."

read -p "Continue? [Y/n]: " CONFIRM
if [[ "${CONFIRM:-y}" != "y" ]]; then
    echo "Exiting."
    exit 0
fi

read -p "Enter app_name: " APP_NAME

APPIMAGE_PATH="${HOME}/Downloads/${APP_NAME}.AppImage"
PNG_PATH="${HOME}/Downloads/${APP_NAME}.png"

APPIMAGE_INSTALL_DIR="${HOME}/.local/bin"
PNG_INSTALL_DIR="${HOME}/.local/share/icons/apps"
DESKTOP_DIR="${HOME}/.local/share/applications"

echo "Moving AppImage to ~/.local/bin"
mkdir -p "${APPIMAGE_INSTALL_DIR}"
mv "${APPIMAGE_PATH}" "${APPIMAGE_INSTALL_DIR}/${APP_NAME}.AppImage"
chmod +x "${APPIMAGE_INSTALL_DIR}/${APP_NAME}.AppImage"

echo "Moving icon to ~/.local/share/icons/apps"
mkdir -p "${PNG_INSTALL_DIR}"
mv "${PNG_PATH}" "${PNG_INSTALL_DIR}/${APP_NAME}.png"

echo "Creating desktop entry"
mkdir -p "${DESKTOP_DIR}"
cat > "${DESKTOP_DIR}/${APP_NAME}.desktop" <<-EOF
[Desktop Entry]
Name=${APP_NAME}
Exec=${APPIMAGE_INSTALL_DIR}/${APP_NAME}.AppImage
Icon=${PNG_INSTALL_DIR}/${APP_NAME}.png
Type=Application
EOF

echo "Installed successfully!"
read -p "Press Enter to close."
