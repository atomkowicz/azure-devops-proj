# Overview
This is a training project from Udacity Azure DevOps Nanodegree.
The Purpose of this project is to build a scaffolding that will assist in performing both Continuous Integration and Continuous Delivery. 
Github Actions will perform an initial lint, test, and install cycle. 
Continuous Delivery to Azure App Service is set up using Azure Pipelines integration.

## Project Plan

* Trello board: https://trello.com/b/yIfaIt4c/board-sklearn-flask-app
* Spreadsheet with the project plan: https://docs.google.com/spreadsheets/d/1J4lHbIkctcIvDkE9NPgnKiSGkTGzjTvcXjnVQwpdfgI/edit?usp=sharing

## Instructions

Project overview: architectural diagram 

![Architectural Diagram](screenshots/schema.jpg?raw=true "Diagram")

### CI: Set up Azure Cloud Shell

* Launch Azure Cloud Shell and generate ssh keys. 

    ```
    ssh-keygen -t rsa
    ```
* Place your public key content in Github profile settings. Clone github repository into Azure Cloud Shell:

    ```
    git clone git@github.com:atomkowicz/azure-devops-proj.git
    ```

    Project cloned into Azure Cloud Shell:

    ![Azure Cloud Shell git clone](screenshots/1.azure-cloud-shell-clone.jpg?raw=true "Clone repo to Azure Cloud Shell")

* Set up virtual environment:

    ```
    python3 -m venv ~/.azure-devops-proj
    source ~/.azure-devops-proj/bin/activate
    ```

* Install, lint and test

    ```
    make all
    ```

    Passing tests that are displayed after running the `make all` command from the `Makefile`:

    ![Test output](screenshots/test-passed.jpg?raw=true "Tests passed")

* Run the project app.py file to prove it works

    ```
    python3 app.py
    ```

* Create App Service

    ```
    az webapp up -n azure-devops-proj --sku F1
    ```

    Project running on Azure App Service:


    ![App Service](screenshots/appservice-running.jpg?raw=true "Azure App Service")

* Make prediction

    ```
    ./make_prediction_azure_app.sh
    ```
    The output should be similar to:

    ![Make prediction](screenshots/make-prediction.jpg?raw=true "Make predictions output")

### CI: Configure Github Actions

* Set up Github Actions and verify remote tests pass

    ![Github Actions](screenshots/github-actions.jpg?raw=true "Github Actions")


### CD: Create and configure Azure Pipeline

* Set up new project on Azure dev ops and create new pipeline. [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

    ![Azure pipeline](screenshots/pipelines.jpg?raw=true "Azure pipeline")

* Run command to see logs

    ```
    az webapp log tail
    ```

    Output of streamed log files from deployed application:

    ![Logs](screenshots/logs.jpg?raw=true "Logs")

### Test with Locust

* Perform a load test on the website

    ![Locust](screenshots/run-locust-1.jpg?raw=true "Locust")
    ![Locust](screenshots/run-locust.jpg?raw=true "Locust")

## Enhancements

* Create dev, stage and prod environment
* Add tests
* Run with Kubernetes
* Using Github Actions instead of Azure pipelines

## Demo 



![CI](https://github.com/atomkowicz/azure-devops/workflows/CI/badge.svg)
