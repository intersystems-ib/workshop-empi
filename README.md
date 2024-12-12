# Vector Search for MPI
In this workflow we are going to test the Vector Search functionality applied for the management of an hipotetic Master Patient Index using the Vector Storage capabilities of IRIS database. 

# What do you need to install? 
* [Git](https://git-scm.com/downloads) 
* [Docker](https://www.docker.com/products/docker-desktop) (if you are using Windows, make sure you set your Docker installation to use "Linux containers").
* [Docker Compose](https://docs.docker.com/compose/install/)
* [Visual Studio Code](https://code.visualstudio.com/download) + [InterSystems ObjectScript VSCode Extension](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript)

# Setup
Build the image we will use during the workshop:

```console
$ git clone https://github.com/intersystems-ib/workshop-empi
$ cd workshop-empi
$ docker-compose build
```

# Introduction

## What is purpose of this project?

The main purpose of this project is to develop an interoperability production to generate embeddings for the demographic information of patients received from HL7 messages and to provide possible duplicated patients as the Master Patient Index tools do using the vector search capabilities of IRIS.

## How does this project work?

This project is designed as a docker compose project developed on InterSystems IRIS for Health Community edition and it uses a pre-trained text-similarity model named [all-MiniLM-L6-v2](https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2).

As we said before, our code is developed on InterSystems IRIS for Health leveraging the Embedded Python and Vector Search functionalities. The project is responsible for:
* Import HL7 file from */shared/in* folder.
* Transform the PID segment of HL7 message into a custom message.
* Download model and generate the embeddings for the demographic info using [Embedded Python](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=AFL_epython) capabilities.
* Storage of embeddings into IRIS database and generation of response with the list of possible patient duplicates using Vector Search.


# Testing the project 
* Run the containers to deploy the backend and the frontend:
```
docker-compose up -d
```
Automatically an IRIS instance will be deployed and a production will be configured and run available to import data to create the prediction model and train it.

* Open the [Management Portal](http://localhost:52774/csp/sys/%25CSP.Portal.Home.zen?$NAMESPACE=EMPI).
* Login using the default `superuser`/ `SYS` account.
* Click on [Production](http://localhost:52774/csp/healthshare/empi/EnsPortal.ProductionConfig.zen?PRODUCTION=EMPI.Production) to access the production that we are going to use. You can access also through *Interoperability > User > Configure > List > Productions* and select *EMPI.Production*.