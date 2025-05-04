#!/bin/bash

# Build the Electron app
npm install
npm run dist

# Create installation directories
sudo mkdir -p /opt/icloud-notes
sudo mkdir -p /usr/local/bin
sudo mkdir -p /usr/share/applications
sudo mkdir -p /usr/share/pixmaps

# Copy application files
sudo cp -r dist/linux-unpacked/* /opt/icloud-notes/

# Create launcher script
echo '#!/bin/bash' | sudo tee /usr/local/bin/icloud-notes > /dev/null
echo 'exec /opt/icloud-notes/icloud-notes "$@"' | sudo tee -a /usr/local/bin/icloud-notes > /dev/null
sudo chmod +x /usr/local/bin/icloud-notes

# Create desktop entry
cat << EOF | sudo tee /usr/share/applications/icloud-notes.desktop > /dev/null
[Desktop Entry]
Name=iCloud Notes
Comment=An Unofficial desktop app for iCloud Notes
Exec=icloud-notes
Terminal=false
Type=Application
Icon=icloud-notes
Categories=Network;TextTools;Office;GTK;GNOME;
EOF

# Copy icon
sudo cp icon.png /usr/share/pixmaps/icloud-notes.png

echo "iCloud Notes has been installed. You can run it from your application menu or by typing 'icloud-notes' in terminal."
