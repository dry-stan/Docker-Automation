
# Docker Automation

Docker Automation is a script that simplifies the installation of Docker and related tools on various Linux distributions. It's designed to streamline the setup process for Docker enthusiasts and developers.

## Installation

Before installing Docker Automation, please ensure that your operating system is up-to-date. Follow these steps:
1. **Update Your Operating System:**
Ensure your system is updated by running the following command:
```bash
  sudo apt update && sudo apt upgrade -y   # For Debian/Ubuntu
```
```bash
  sudo yum update -y                      # For CentOS/Fedora
```
```bash
  sudo pacman -Syu --noconfirm            # For Arch Linux
```
```bash
  sudo zypper update -y                   # For OpenSUSE
```    
2. **Create a Docker Directory:**
```bash
  mkdir docker && cd docker
```
3. **Execute the Installation Script:**
```bash
  bash <(curl -Ls https://raw.githubusercontent.com/dry-stan/Docker-Automation/main/docker-tools-installer.sh)
```
This script will guide you through the installation process and ensure that Docker and its dependencies are set up correctly on your system.

4. **Follow On-Screen Instructions:**
During the installation process, follow any on-screen instructions provided by the script.

That's it! You've successfully installed Docker Automation and configured Docker on your system.
## Features

Docker Automation offers the following features to enhance your Docker installation experience:

- **Simplified Installation:** Quickly and easily install Docker and related tools on various Linux distributions.

- **Automatic Updates:** Docker Automation checks for updates to ensure you have the latest version, providing a hassle-free experience.

- **Cross-Distribution Compatibility:** Compatible with popular Linux distributions, including Debian, Ubuntu, CentOS, Fedora, Arch Linux, and OpenSUSE.

- **User-Friendly:** The script guides you through the installation process with clear instructions and prompts.

- **Enhanced Security:** Docker Automation helps you set up Docker with recommended security practices.

- **Customization:** Easily configure Docker to suit your specific needs during the installation process.

- **Efficiency:** Save time and effort with a streamlined installation process, whether you're a beginner or an experienced user.

- **Community-Driven:** An active community of users and contributors supports Docker Automation, ensuring ongoing improvements and updates.

- **Lightweight:** The script is designed to be lightweight and efficient, minimizing system resource usage.

- **Open Source:** Docker Automation is open-source software, allowing you to inspect and modify the code as needed.

Enjoy the benefits of Docker Automation and simplify your Docker setup on Linux.



## License

This project is licensed under the [GNU General Public License v3.0](https://github.com/dry-stan/Docker-Automation/blob/9ea6c05ed7162dde81ca14711bc30ef4eb1f6dae/LICENSE)

