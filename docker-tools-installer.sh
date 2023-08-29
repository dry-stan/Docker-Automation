#!/bin/bash

# User-friendly introduction
clear
echo "Welcome to the Docker and Related Tools Installation Script!"
echo "This script will help you install Docker and related tools on various Linux distributions."
echo

# OS selection menu
while true; do
    echo "Please select your operating system:"
    options=("Debian/Ubuntu" "CentOS/Fedora" "Arch Linux" "OpenSUSE" "Exit")
    select opt in "${options[@]}"; do
        case $opt in
            "Debian/Ubuntu")
                OS="debian"
                break
                ;;
            "CentOS/Fedora")
                OS="centos"
                break
                ;;
            "Arch Linux")
                OS="arch"
                break
                ;;
            "OpenSUSE")
                OS="opensuse"
                break
                ;;
            "Exit")
                exit 0
                ;;
            *)
                echo "Invalid option. Please select a valid option."
                ;;
        esac
    done

    # Function to install Docker
    install_docker() {
        echo "Installing Docker..."
        if [ "$OS" == "debian" ] || [ "$OS" == "ubuntu" ]; then
            sudo apt update
            sudo apt install -y docker.io
        elif [ "$OS" == "centos" ] || [ "$OS" == "fedora" ]; then
            sudo yum install -y docker
        elif [ "$OS" == "arch" ]; then
            sudo pacman -Syu --noconfirm docker
        elif [ "$OS" == "opensuse" ]; then
            sudo zypper --non-interactive install docker
        fi

        # Start and enable Docker service
        sudo systemctl start docker
        sudo systemctl enable docker

        echo "Docker has been installed and started."
    }

    # Function to install Docker Compose
    install_docker_compose() {
        echo "Installing Docker Compose..."
        sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose

        echo "Docker Compose has been installed."
    }

    # Function to install NGINX Proxy Manager
    install_nginx_proxy_manager() {
        echo "Installing NGINX Proxy Manager..."
        
        # Create NGINX Proxy Manager directory
        mkdir -p ~/nginx-proxy-manager
        cd ~/nginx-proxy-manager || exit
        
        # Create a Docker Compose file
        echo "version: '3.8'
        services:
          app:
            image: 'jc21/nginx-proxy-manager:latest'
            container_name: nginx-proxy-manager
            restart: unless-stopped
            ports:
              - '80:80'
              - '81:81'
              - '443:443'
            volumes:
              - ./data:/app/data
              - ./letsencrypt:/app/letsencrypt
              - ./config:/app/config" > docker-compose.yml

        # Run Docker Compose
        docker-compose up -d

        echo "NGINX Proxy Manager has been installed."
        echo "Your credentials are:"
        echo "Email:    admin@example.com"
        echo "Password: changeme"
    }

    # Function to install Portainer CE
    install_portainer_ce() {
        echo "Installing Portainer CE..."
        docker volume create portainer_data
        docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

        echo "Portainer CE has been installed."
    }

    # Main script
    while true; do
        echo
        echo "Please select an option:"
        tools=("Install Docker" "Install Docker Compose" "Install NGINX Proxy Manager" "Install Portainer CE" "Install All" "Exit")
        select tool in "${tools[@]}"; do
            case $tool in
                "Install Docker")
                    install_docker
                    ;;
                "Install Docker Compose")
                    install_docker_compose
                    ;;
                "Install NGINX Proxy Manager")
                    install_nginx_proxy_manager
                    ;;
                "Install Portainer CE")
                    install_portainer_ce
                    ;;
                "Install All")
                    install_docker
                    install_docker_compose
                    install_nginx_proxy_manager
                    install_portainer_ce
                    echo "All selected tools have been installed."
                    if [ "$tool" == "Install All" ]; then
                        echo "Your credentials for NGINX Proxy Manager are:"
                        echo "Email:    admin@example.com"
                        echo "Password: changeme"
                    fi
                    ;;
                "Exit")
                    exit 0
                    ;;
                *)
                    echo "Invalid option. Please select a valid option."
                    ;;
            esac
            read -p "Press Enter to continue..."
            clear
        done
    done
done
