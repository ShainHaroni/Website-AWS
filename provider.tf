# Find the folder and gets the credentials
provider "aws" {
    profile = "default"
    region  = "eu-west-2"
}

provider "github" {
  token = "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"
}