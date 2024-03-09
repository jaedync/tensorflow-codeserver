#!/bin/bash

# Update config.yaml with the password from the environment variable
echo "bind-addr: 0.0.0.0:8080" > ~/.config/code-server/config.yaml
echo "auth: password" >> ~/.config/code-server/config.yaml
echo "password: $PASSWORD" >> ~/.config/code-server/config.yaml

# Start code-server
code-server --config ~/.config/code-server/config.yaml
