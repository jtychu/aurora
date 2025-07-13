# Setup global identity for Git
[group('Apps')]
setup-git-global-identity NAME="prompt" EMAIL="prompt":
    #!/usr/bin/bash
    
    NAME={{ NAME }}
    EMAIL={{ EMAIL }}

    if [ "$NAME" == "prompt" ]; then
        echo -en "Please enter your name to use with Git: "
        read NAME
    fi

    if [ "$EMAIL" == "prompt" ]; then
        echo -en "Please enter your email to use with Git: "
        read EMAIL
    fi

    git config --global user.name "$NAME"
    git config --global user.email "$EMAIL"
