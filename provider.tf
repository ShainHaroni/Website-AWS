# Find the folder and gets the credentials
provider "aws" {
    profile = "default"
    region  = "eu-west-2"
}

provider "github" {
  token = "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"
}