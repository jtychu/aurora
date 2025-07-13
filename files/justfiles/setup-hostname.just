# Set system static and pretty hostname
[group('System')]
set-hostname:
    #!/bin/bash
    
    set -euxo pipefail

    read -p 'Static hostname: ' static_hostname
    read -p 'Pretty hostname: ' pretty_hostname
    hostnamectl set-hostname $static_hostname --static
    hostnamectl set-hostname $pretty_hostname --pretty
