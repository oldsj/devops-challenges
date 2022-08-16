# devops-challenges

A project based approach to learning DevOps skills in an isolated, local environment that runs right on your machine. Automated tests give feedback and let you know if you're on the right track.

## :battery: Batteries Included

There's no need to set up any tooling or configure AWS access, all tools are preconfigured to work together so you can jump right in to learning and writing infrastructure code.

## :gear: Setup

- You will need Docker installed https://www.docker.com/get-started

- Clone this repo locally

```
git clone https://github.com/oldsj/devops-challenges.git
cd devops-challenges
```

## :cloud: Environment

The challenge environment is configured with Docker compose and provides a local AWS mock with [moto-server](https://github.com/spulec/moto). All `aws` and `terraform` commands will use your local mock AWS environmment and not the real cloud. Any resources you create will not incur cost.

Get a shell in the environment with

```
docker compose build
docker compose run shell
```

For more information on the local AWS environment, see the diagram at [docs/local-aws-environment.png](docs/local-aws-environment.png)

## :white_check_mark: Challenges

Write infrastructure code and run tests until they pass.

Check out the challenges in the `challenges/` directory. Each challenge has its own README.md with instructions and resources.

Each challenge will have a `test.bats` file that will test your solution with [bats](https://github.com/bats-core/bats-core) and provide feedback on if you met the challenge requirements or not.

### :pencil: Prerequisite Knowledge

Each challenge will have its own difficulty level and will have prerequisite knowledge for that specific challenge described in more detail in the challenge's README.md.

All challanges assume a basic level familiarity with the following tools

- git
- docker
- \*nix shell
- navigating a code editor or IDE
