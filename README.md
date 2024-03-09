# TensorFlow Code Server

This repository contains a Docker setup for running TensorFlow with code-server, providing a web-based IDE for TensorFlow development with GPU support.

## Prerequisites

- Docker
- Docker Compose
- NVIDIA GPU with CUDA support (for GPU-enabled containers)

## Getting Started

1. Clone this repository:

```bash
git clone https://github.com/jaedync/tensorflow-codeserver.git
cd tensorflow-codeserver
```

2. Create the necessary directories for code-server workspaces and configurations:

```bash
mkdir -p code1/workspace code1/config code2/workspace code2/config
```

3. Start the code-server containers using Docker Compose:

```bash
docker-compose up -d
```

4. Access the code-server instances in your web browser:
   - code-server-1: `http://localhost:8443`
   - code-server-2: `http://localhost:8444`

5. Enter the respective passwords when prompted. The defaults are as follows and should be changed:
   - code-server-1: `123abc`
   - code-server-2: `abc123`

## Configuration

- The `docker-compose.yml` file defines two code-server services, each with its own workspace and configuration volumes. More code-server instances can be created here if needed.
- The `Dockerfile` in the `coder` directory is used to build the code-server image with TensorFlow GPU support.
- The `start-code-server.sh` script is used to update the code-server configuration with the password from the environment variable and start code-server.
- You can modify the `settings.json` file in the `coder` directory to customize code-server settings. This may not be supported or work as intended.

## Customization

- To change the passwords for the code-server instances, modify the `PASSWORD` environment variables in the `docker-compose.yml` file.
- To customize the code-server settings, modify the `settings.json` file in the `coder` directory.
- You can add additional dependencies or modify the `Dockerfile` to suit your specific requirements.

## Persistent Data

- The `code1/workspace` and `code2/workspace` directories are mounted as volumes in the respective code-server containers, allowing you to persist your project files.
- The `code1/config` and `code2/config` directories are mounted as volumes to store code-server configurations for each instance.

## GPU Support

- The code-server containers are configured to use NVIDIA GPUs by default where applicable.
- Make sure you have the necessary NVIDIA drivers and CUDA installed on your host system.

## Troubleshooting

- If you encounter any issues with the setup, please ensure that you have the latest versions of Docker and Docker Compose installed.
- Make sure your NVIDIA GPU drivers and CUDA are properly set up and compatible with the TensorFlow version used in the image.

## Acknowledgements

- [TensorFlow](https://www.tensorflow.org/)
- [code-server](https://github.com/coder/code-server)