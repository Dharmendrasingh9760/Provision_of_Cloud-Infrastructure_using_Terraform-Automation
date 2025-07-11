resource "aws_s3_bucket" "s3bucket" {
        bucket = var.bucketname
}
resource "aws_s3_bucket_ownership_controls" "own" {
        bucket = aws_s3_bucket.s3bucket.id

        rule {
                object_ownership = "BucketOwnerPreferred"
        }
}
resource "aws_s3_bucket_public_access_block" "example" {
        bucket = aws_s3_bucket.s3bucket.id

        block_public_acls = false
        block_public_policy = false
        ignore_public_acls = false
        restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "example" {
        depends_on = [
                aws_s3_bucket_ownership_controls.own,
                aws_s3_bucket_public_access_block.example,
        ]

        bucket = aws_s3_bucket.s3bucket.id
        acl = "public-read"
}
resource "aws_s3_bucket_object" "index" {
        bucket = aws_s3_bucket.s3bucket.id
        key = "index.html"
        source = "index.html"
        etag = filemd5("index.html")
        acl = "public-read"
        content_type = "text/html"
}
resource "aws_s3_bucket_object" "error" {
        bucket = aws_s3_bucket.s3bucket.id
        key = "error.html"
        source = "error.html"
        etag = filemd5("error.html")
        acl = "public-read"
        content_type = "text/html"
}
resource "aws_s3_bucket_website_configuration" "s3staticwebsite" {
        bucket = aws_s3_bucket.s3bucket.id

        index_document {
                suffix = "index.html"
        }

        error_document {
                key = "error.html"
        }
}
output "endpoint" {
        value = aws_s3_bucket.s3bucket.website_endpoint
}
