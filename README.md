# Developmenet Container For igsr5

## What is Delopment Container?

https://github.com/devcontainers/spec

> A development container allows you to use a container as a full-featured development environment. It can be used to run an application, to separate tools, libraries, or runtimes needed for working with a codebase, and to aid in continuous integration and testing.

![](https://github.com/devcontainers/spec/blob/main/images/dev-container-stages.png)


## Usage

You can use some [devcontainer-feature](https://github.com/devcontainers/features/tree/main) customized for me.


e.g. `Ruby on Rails` Application (api mode)

```json
{
  "name": "dev",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "hostRequirements": {
    "cpus": 8,
    "memory": "8gb",
    "storage": "32gb"
  },
  "features": {
    "ghcr.io/devcontainers/features/sshd:1": {
      "version": "latest"
    },
    "ghcr.io/igsr5/devcontainer/ruby:latest": {},
    "ghcr.io/igsr5/devcontainer/common-tools:latest": {}
  }
}
```

e.g. Frontend Application

```json
{
  "name": "dev",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "hostRequirements": {
    "cpus": 8,
    "memory": "8gb",
    "storage": "32gb"
  },
  "features": {
    "ghcr.io/devcontainers/features/sshd:1": {
      "version": "latest"
    },
    "ghcr.io/igsr5/devcontainer/frontend:latest": {},
    "ghcr.io/igsr5/devcontainer/common-tools:latest": {}
  }
}
```
For more details, please check this link https://github.com/igsr5/devcontainer/tree/master/features. 


## Repo Structure

```
.
├── README.md
├── features
│   ├── common-tools
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
│   ├── ruby
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
|   ├── ...
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
...
```

* [`features`](https://github.com/igsr5/devcontainer/tree/master/features) - A collection of subfolders, each declaring a Feature. Each subfolder contains at least a `devcontainer-feature.json` and an `install.sh` script.

## Devlopment

### Creating your own collection of Features
The [Feature distribution specification](https://containers.dev/implementors/features-distribution/) outlines a pattern for community members and organizations to self-author Features in repositories they control.

When you push to the master branch, Github Actions workflows will publish all features in `/features`.
For more details, please check this link https://github.com/igsr5/devcontainer/blob/master/.github/workflows/feature-release.yaml.


## License
The repository is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
