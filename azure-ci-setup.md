CI Pipeline Setup Using GitLab CI or Azure DevOps

1. Defining Pipeline Stages

A CI pipeline typically consists of multiple stages to automate software development workflows. Below are the key stages:

Build Stage

Configure the build process by defining steps in a GitLab CI/CD YAML file (.gitlab-ci.yml) or Azure DevOps pipeline YAML file (azure-pipelines.yml).

Example for GitLab CI:

stages:
  - build

build:
  stage: build
  script:
    - echo "Building application..."
    - dotnet build

Example for Azure DevOps:

stages:
- stage: Build
  jobs:
  - job: Build
    steps:
    - script: echo "Building application..."
    - script: dotnet build

Test Stage

Run tests to ensure code stability.

Example for GitLab CI:

test:
  stage: test
  script:
    - echo "Running tests..."
    - dotnet test

Example for Azure DevOps:

- stage: Test
  jobs:
  - job: Test
    steps:
    - script: echo "Running tests..."
    - script: dotnet test

Deploy Stage

Deploy the application to an Azure VM using SSH or Azure CLI.

Example for GitLab CI:

deploy:
  stage: deploy
  script:
    - echo "Deploying application..."
    - az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID
    - az webapp deployment source config-zip -g myResourceGroup -n myAppName --src app.zip

Example for Azure DevOps:
