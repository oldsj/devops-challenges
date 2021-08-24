# devops-challenges

A project based approach to learning devops skills.

- [devops-challenges](#devops-challenges)
  - [Setup](#setup)
  - [Environment](#environment)
  - [Challenges](#challenges)

## Setup

You will need Docker installed https://www.docker.com/get-started

Clone this repo locally

```
git clone https://github.com/oldsj/devops-challenges.git
cd devops-challenges
```

## Environment

The challenge environment is configured with a local only AWS mock with moto-server. All `aws` and `terraform` commands will use your local only AWS environmment.

Get a shell in the challenge environment with

```
docker compose build
docker compose run shell
```

Each challenge will have a `test.bats` file that will test your code with [bats](https://github.com/bats-core/bats-core).

Write infrastructure code and run tests until they pass.

## Challenges

Check out the challenges in the `challenges/` directory. Each challenge has its own README.md with instructions and resources.
