# Install Youtube Music | https://github.com/th-ch/youtube-music
[group('Apps')]
install-youtube-music:
    #!/usr/bin/bash

    OWNER="th-ch"
    REPO="youtube-music"
    PATTERN="*x86_64.flatpak"
    DOWNLOAD_DIR="$HOME/Downloads"

    echo "Downloading latest Flatpak version for Youtube Music"
    gh release download \
        --repo "$OWNER/$REPO" \
        --pattern "$PATTERN" \
        --dir "$DOWNLOAD_DIR"

    FLATPAK=$(find $DOWNLOAD_DIR -regex ".*/YouTube-Music-[0-9]+\.[0-9]+\.[0-9]+-x86_64.flatpak" -type f | head -n 1)

    if [ -f "$FLATPAK" ]; then
        echo -n "Are you sure you want to install $FLATPAK? [Y/n]: "
        read CONFIRM

        if [ "$CONFIRM" == "" ] || [ "${CONFIRM,,}" == "y" ]; then
            echo "Installing Youtube Music"
            flatpak install --or-update $FLATPAK
        else
            echo "Installation cancelled"
        fi
    else
        echo "File not found. Please try again later or download manually from https://github.com/$OWNER/$REPO"
    fi
