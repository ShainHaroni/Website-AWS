
resource "aws_codepipeline" "github" {
  name     = "github-pipeline"
  role_arn = "${aws_iam_role.AWSCodePipeline_role.arn}" 

  artifact_store {
    location = "${aws_s3_bucket.sre-position-pipeline.bucket}"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {      
        name             = "Source"
        category         = "Source"
        owner            = "AWS"
        provider         = "CodeStarSourceConnection"
        version          = "1"
        output_artifacts = ["SourceArtifact"]

      configuration= {
        ConnectionArn = aws_codestarconnections_connection.connect_codestar.arn
        FullRepositoryId = "ShainHaroni/Website-AWS"
        BranchName = "main"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["SourceArtifact"]
      version         = "1"

      configuration= {
        BucketName = "sre-position-pipeline"
        Extract = "true"
      }
    }
  }
}