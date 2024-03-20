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

tfenv install latest

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

to free up space run

```bash
docker system prune -a -f
```

## Prebuild

```bash
sudo npm install -g @devcontainer/cli
```

## Attach to running container

```bash
devcontainer exec --workspace-folder ./ /usr/bin/zsh
```

### Authenticate to your container registry github/docker/azure

On Linux x86_64

```bash
sudo devcontainer build --workspace-folder . --platform linux/amd64 --image-name docker.io/robinmordasiewicz/devcontainer:latest
docker image push robinmordasiewicz/devcontainer:latest
```

On Mac arm64

```bash
devcontainer build --workspace-folder . --platform darwin/amd64 --image-name docker.io/robinmordasiewicz/devcontainer:latest
docker image push robinmordasiewicz/devcontainer:latest
```
