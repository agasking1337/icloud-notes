# Publishing iCloud Notes on Arch Linux

This guide explains how to package, publish, and install iCloud Notes on Arch Linux.

## For Package Maintainers

### Prerequisites

- An Arch Linux system
- `base-devel` package group installed
- A GitHub account (for hosting the source code)
- An AUR account (for publishing the package)

### Steps to Publish to AUR

1. **Update the PKGBUILD file**
   - Modify the source URL to point to your actual GitHub repository
   - Update the maintainer information with your details
   - Calculate the correct SHA256 checksum for your source archive

2. **Test the package locally**

   ```bash
   # Navigate to the directory containing PKGBUILD
   cd /path/to/icloud-notes
   
   # Build the package
   makepkg -s
   
   # Install the package locally to test
   sudo pacman -U icloud-notes-1.2.0-1-x86_64.pkg.tar.zst
   ```

3. **Generate .SRCINFO file**

   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

4. **Create a new AUR package**

   ```bash
   # Clone the AUR repository (replace 'icloud-notes' with your package name)
   git clone ssh://aur@aur.archlinux.org/icloud-notes.git
   cd icloud-notes
   
   # Copy your PKGBUILD and .SRCINFO
   cp /path/to/your/PKGBUILD .
   cp /path/to/your/.SRCINFO .
   
   # Add, commit, and push
   git add PKGBUILD .SRCINFO
   git commit -m "Initial commit"
   git push
   ```

## For Users: Installing iCloud Notes on Arch Linux

### Method 1: Using an AUR Helper (Recommended)

```bash
# Using yay
yay -S icloud-notes

# Using paru
paru -S icloud-notes
```

### Method 2: Manual Installation from AUR

```bash
# Clone the AUR package
git clone https://aur.archlinux.org/icloud-notes.git
cd icloud-notes

# Build and install the package
makepkg -si
```

### Method 3: Using the Pre-built Package

If you've built a package file (`.pkg.tar.zst`), you can distribute it directly:

```bash
sudo pacman -U icloud-notes-1.2.0-1-x86_64.pkg.tar.zst
```

## Troubleshooting

- **Dependency Issues**: Make sure you have the correct version of electron installed. The package depends on `electron30`.
- **Build Failures**: Check that you have all the required build dependencies installed (`npm` and `nodejs`).
- **Runtime Errors**: If the application fails to start, check the console output for errors.

## Updating the Package

When releasing a new version:

1. Update the `pkgver` in PKGBUILD
2. Update the source URL if necessary
3. Regenerate the .SRCINFO file
4. Commit and push changes to the AUR

```bash
git clone ssh://aur@aur.archlinux.org/icloud-notes.git
cd icloud-notes
# Update PKGBUILD
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Update to version X.Y.Z"
git push
```
