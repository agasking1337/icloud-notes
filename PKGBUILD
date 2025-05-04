# Maintainer: Your Name <your.email@example.com>

pkgname=icloud-notes
pkgver=1.2.0
pkgrel=1
pkgdesc="An Unofficial desktop app for iCloud Notes"
arch=('x86_64')
url="https://apps.himelrana.com/icloud-notes"
license=('ISC')
depends=('electron30')
makepends=('npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yourusername/icloud-notes/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  npm install
  npm run dist -- -l dir
}

package() {
  cd "$pkgname-$pkgver"
  
  # Create directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  
  # Copy app files
  cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname"
  
  # Create launcher script
  echo '#!/bin/sh' > "$pkgdir/usr/bin/$pkgname"
  echo "exec /usr/lib/$pkgname/$pkgname \"\$@\"" >> "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"
  
  # Desktop file
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=iCloud Notes
Comment=An Unofficial desktop app for iCloud Notes
Exec=$pkgname
Terminal=false
Type=Application
Icon=$pkgname
Categories=Network;TextTools;Office;GTK;GNOME;
EOF
  
  # Icon
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
