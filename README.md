# devcontainer

## VSCode Plugin

https://code.visualstudio.com/docs/devcontainers/containers

## Fonts

For best results install Nerd fonts in VSCode:

* Mac brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font

* Windows - Google it

1. Open VSCode Settings

2. Search for "terminal.integrated.fontFamily"

3. Type in "MesloLGS NF"

## mkdocs

http://127.0.0.1:8000

## Terraform

```bash
tfenv install
tfenv use
```

## Github CLI

gh auth login

## Ollama on Mac

https://nonsequiturs.com/posts/run-ollama-in-the-menu-bar-on-macos-with-custom-host-bindings/?s=%23YOUREWELCOME

* Open Script Editor and paste the following text

```
do shell script "launchctl setenv OLLAMA_ORIGINS '*'"
do shell script "launchctl setenv OLLAMA_HOST \"0.0.0.0\""
tell application "Ollama" to run
```

* export the script as an Application

* add the appliation to login items

## Troubleshooting docker

Clearing the cache sometimes helps with extensions not loading.

```bash
docker system prune -a -f
```

## Attach to running container

```bash
devcontainer exec --workspace-folder ./ /usr/bin/zsh
```
## Run a container from the cli

```bash
devcontainer up --workspace-folder ./
```

## Prebuild

```bash
sudo npm install -g @devcontainers/cli
```

### Linux

docker run --privileged --rm tonistiigi/binfmt --install all

https://docs.docker.com/storage/containerd/
docker info -f '{{ .DriverStatus }}'

### Mac

Disable the flag Use containerd for pulling and storing images within the feature of Docker Desktop to solve it.
Disable Rosetta
You find the setting Use containerd for pulling and storing images in Docker Desktop, "Settings" > "Features in development"

[Docker Desktop Mac](./docs/images/docker-desktop-settings.png)

```bash
devcontainer build --workspace-folder . --platform linux/arm64,linux/amd64 --image-name docker.io/robinmordasiewicz/devcontainer:latest --output type=docker --no-cache false
```

### Authenticate to your container registry github/docker/azure and push the image

```bash
docker login
docker push robinmordasiewicz/devcontainer:latest
```

