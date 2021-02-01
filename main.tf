terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }

  # backend "s3" {
  #   bucket = "terraform-infrastructure"
  #   key    = "state/eep-messaging-aggregator-aws.tfstate"
  #   region = "us-east-1"
  # }
}

provider "aws" {
  region = "us-east-1"
}

module "financial-information" {
  source       = "./tf-modules/financial-information"
  service_name = local.service_name
  module_name  = "financial-information"
  app_env      = var.app_env
}

module "location-information" {
  source       = "./tf-modules/location-information"
  service_name = local.service_name
  module_name  = "location-information"
  app_env      = var.app_env
}

module "personal-information" {
  source       = "./tf-modules/personal-information"
  service_name = local.service_name
  module_name  = "personal-information"
  app_env      = var.app_env
}

module "request-person-data" {
  source       = "./tf-modules/request-person-data"
  service_name = local.service_name
  module_name  = "request-person-data"
  app_env      = var.app_env
}
