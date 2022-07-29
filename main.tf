resource "aws_s3_bucket" "image_storage" {
  bucket = "dev-cbb-bucket"
}

resource "aws_s3_bucket_lifecycle_configuration" "l1" {
  bucket = aws_s3_bucket.image_storage.id
  rule {
    status = "Enabled"
    id     = "expire_all_files"
    noncurrent_version_expiration {
        noncurrent_days = 5
    }
  }
}

resource "aws_s3_bucket_acl" "image_storage_acl" {
  bucket = aws_s3_bucket.image_storage.id
  acl    = "public-read"
}
