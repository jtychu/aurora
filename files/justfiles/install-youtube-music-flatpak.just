# Install YouTube Music desktop app flatpak | https://github.com/th-ch/youtube-music
[group('Apps')]
install-youtube-music-flatpak:
    #!/usr/bin/bash

    OWNER="th-ch"
    REPO="youtube-music"
    PATTERN="*x86_64.flatpak"
    DOWNLOAD_DIR="$HOME/Downloads"

    echo "Downloading latest YouTube Music flatpak using GitHub CLI…"

    if ! command -v gh >/dev/null 2>&1; then
        echo "GitHub CLI not installed. Please install from https://cli.github.com/ or download YouTube Music manually from https://github.com/$OWNER/$REPO"
        exit
    fi

    gh release download \
        --repo "$OWNER/$REPO" \
        --pattern "$PATTERN" \
        --dir "$DOWNLOAD_DIR"

    FLATPAK=$(find $DOWNLOAD_DIR -regex ".*/YouTube-Music-[0-9]+\.[0-9]+\.[0-9]+-x86_64.flatpak" -type f | head -n 1)

    if [ -f "$FLATPAK" ]; then
        echo -n "Are you sure you want to install $FLATPAK? [Y/n]: "
        read CONFIRM

        if [ "$CONFIRM" == "" ] || [ "${CONFIRM,,}" == "y" ]; then
            echo "Installing YouTube Music"
            flatpak install --or-update $FLATPAK

            if [ $? -eq 0 ]; then
                rm -f $FLATPAK
            fi
        else
            echo "Installation cancelled"
        fi
    else
        echo "File not found. Please try again or download manually from https://github.com/$OWNER/$REPO"
    fi
