resource "aws_s3_bucket" "s3-cicd" {
  bucket = "josh-mz-s3-cicd-pipeline"

  tags = {
    Name        = "josh-mz-s3-cicd-pipeline"
    Environment = "Dev"
    User        = "joshcloud@mz.co.kr"
  }
}