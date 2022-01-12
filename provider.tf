# Find the folder and gets the credentials
provider "aws" {
    profile = "default"
    region  = "eu-west-2"
}

provider "github" {
  token = "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"
}