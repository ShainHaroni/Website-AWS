
# Connect pipeline to github

locals {
  webhook_secret = "super-secret"
}

resource "aws_codepipeline_webhook" "webhook" {
  name            = "pipeline_webhook"
  authentication  = "GITHUB_HMAC"
  target_action   = "Source"
  target_pipeline = "${aws_codepipeline.github.name}"

  authentication_configuration {
    secret_token = "${local.webhook_secret}"
  }

  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
}

# Wire the CodePipeline webhook into a GitHub repository.
resource "github_repository_webhook" "webhook" {
  repository = "Website-AWS"

  configuration {
    url          = "${aws_codepipeline_webhook.webhook.url}"
    content_type = "form"
    insecure_ssl = true
    secret       = "${local.webhook_secret}"
  }

  events = ["push"]
}