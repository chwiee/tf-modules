# API GATEWAY

## THIS REPO

This repository is a terraform module for provisioning an API Gateway on AWS, the module creates all the resources according to what is described in the variable file of the child module

## How this work

To make the module work just Use the example in [routes.tf](/test-iac/routes.tf)


U need to pass:

- _path_: endpoint to application
- _http_method_: HTTP Method to request (GET, POST, PUT, DELETE).
- _authorization_: Auth type (NONE, AWS_IAM, LAMBDA or Other).
- _target_url_: Full url to application

## Tks

Wallace Bruno :)
