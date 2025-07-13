# Set Git global identity
[group('Apps')]
set-git-global-identity:
    #!/bin/bash
    
    set -euxo pipefail

    read -p 'Git name: ' github_name
    read -p 'Git email: ' github_email
    git config --global user.name "$github_name"
    git config --global user.email "$github_email"
