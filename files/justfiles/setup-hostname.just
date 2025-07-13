# Setup hostname for system
[group('System')]
setup-hostname HOSTNAME="prompt" PRETTYNAME="prompt":
    #!/usr/bin/bash
    
    HOSTNAME={{ HOSTNAME }}
    PRETTYNAME={{ PRETTYNAME }}

    if [ "$HOSTNAME" == "prompt" ]; then
        echo -en "Please enter the hostname to use: "
        read HOSTNAME
    fi

    if [ "$PRETTYNAME" == "prompt" ]; then
        echo -en "(Optional) Please enter the pretty hostname to use: "
        read PRETTYNAME
    fi

    hostnamectl hostname $HOSTNAME

    if [ "$PRETTYNAME" != "" ]; then
        hostnamectl hostname "$PRETTYNAME" --pretty
    fi
