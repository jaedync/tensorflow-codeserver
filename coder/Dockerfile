# Use TensorFlow's latest GPU image as the base image
FROM tensorflow/tensorflow:latest-gpu

# Install basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    sudo \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the SHELL environment variable to /bin/bash
ENV SHELL=/bin/bash

# Create new user 'coder'
RUN useradd -m coder && echo "coder:coder" | chpasswd && adduser coder sudo

# Allow coder to run sudo commands without a password prompt
RUN echo "coder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to coder user
USER coder
WORKDIR /home/coder

# Download and install the latest version of code-server
RUN wget -qO- https://code-server.dev/install.sh | sh

# Create code-server config directory and set password
RUN mkdir -p ~/.config/code-server && \
    echo "bind-addr: 0.0.0.0:8080\nauth: password\npassword: fennec\n" > ~/.config/code-server/config.yaml

# Attempt to copy code-server settings
COPY settings.json /home/coder/.config/Code/User/settings.json

# Overwrite the favicon and PWA icons
USER root
COPY favicon.ico /usr/lib/code-server/src/browser/media/favicon.ico
COPY favicon.ico /usr/lib/code-server/src/browser/media/favicon-dark-support.svg
COPY favicon.ico /usr/lib/code-server/src/browser/media/favicon.svg
COPY pwa-icon-512.png /usr/lib/code-server/src/browser/media/pwa-icon-512.png
COPY pwa-icon-192.png /usr/lib/code-server/src/browser/media/pwa-icon-192.png
COPY pwa-icon.png /usr/lib/code-server/src/browser/media/pwa-icon.png

# Prepare start script
COPY start-code-server.sh /home/coder/start-code-server.sh
RUN chmod +x /home/coder/start-code-server.sh

# Switch back to coder
USER coder
CMD ["/home/coder/start-code-server.sh"]
