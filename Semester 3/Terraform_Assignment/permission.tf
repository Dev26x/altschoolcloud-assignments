data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${module.s3_bucket.bucket_arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [module.cloudfront.cloudfront_origin_access_identity_iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = module.s3_bucket.bucket_name
  policy = data.aws_iam_policy_document.s3_policy.json
}