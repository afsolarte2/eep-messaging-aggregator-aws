# eip-messaging-aggregator-aws
Enterprise Integration Patterns, Messaging, Aggregator with AWS

## Goal
Demonstrate how Aggregator messaging pattern can be implemented under AWS using Lambda, Simple Notification Service and Kinesis Firehose

## Excercise
A company has a microservices architecture, and need to retrieve the information about certain person, but that data is distributed across three different microservices, the one that is responsible for personal information, another one responsible for managing location-related data and the last one that owns the financial information. The challenge here is, to get the results of the three different microservices and reply them as one single result to the requester.

## Solution
Staring at the nature of this problem, the best solution found is by communicating the microservices with messaging systems, in this case AWS Simple Notification Service, the Requester and Repliers can be AWS Lambda Functions and the Aggregator will be AWS Kinesis Firehose.

AWS Resources usage:
* AWS Lambda - Requester: Lambda function that starts the execution. This one requests the personal, location and financial information by publishing a message to a SNS Topic.
* AWS Lambda - Replier-Personal-Information: Lambda function that replies the personal information.
* AWS Lambda - Replier-Location-Information: Lambda function that replies the location information.
* AWS Lambda - Replier-Financial-Information: Lambda function that replies the financial information.

## Deploy Options

### Global Deployment / Deletion
`terraform plan -var app_env="local"`

`terraform validate`

`terraform apply -var 'app_env=local' -auto-approve`

`terraform destroy -var 'app_env=local' -auto-approve`

### Financial Information
`terraform plan -var app_env="local" -target=module.financial-information`

`terraform deploy -var app_env="local" -target=module.financial-information`

### Location Information
`terraform plan -var app_env="local" -target=module.location-information`

`terraform deploy -var app_env="local" -target=module.location-information`

### Personal Information
`terraform plan -var app_env="local" -target=module.personal-information`

`terraform deploy -var app_env="local" -target=module.personal-information`

### Request Person Data
`terraform plan -var app_env="local" -target=module.request-person-data`

`terraform deploy -var app_env="local" -target=module.request-person-data`
