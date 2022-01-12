# Create s3 bucket
resource "aws_s3_bucket" "sre-position-pipeline" {
    bucket = "sre-position-pipeline"
    acl = "private"

    website {
    index_document = "Hello_world.html"
  }
}

# Create HTML file
resource "aws_s3_bucket_object" "Hello_world" {
  bucket       = "${aws_s3_bucket.sre-position-pipeline.bucket}"
  key          = "Hello_world.html"
  source       = "html/Hello_world.html"
  content_type = "text/html"
  etag         = "${md5(file("html/Hello_world.html"))}"
  acl          = "public-read"
}
