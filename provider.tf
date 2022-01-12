# Find the folder and gets the credentials
provider "aws" {
    profile = "default"
    region  = "eu-west-2"
}

provider "github" {
  token = "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"
}