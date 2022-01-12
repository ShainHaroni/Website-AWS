# Find the folder and gets the credentials
provider "aws" {
    profile = "default"
    region  = "eu-west-2"
}

provider "github" {
  token = "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"
}