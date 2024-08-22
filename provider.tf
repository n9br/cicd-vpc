
provider "aws" {
  region = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58.0"
    }
  }

  # TF State Bucket
  backend "s3" {
    bucket  = "cicd-otf-state"
    key     = "state/vpc.tfstate"
    region  = "eu-central-1"
    encrypt = true
    # dynamodb_table = "mycomponents_tf_lockid"
  }
}