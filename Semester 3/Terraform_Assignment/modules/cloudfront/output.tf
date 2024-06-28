output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "The CloudFront Distribution hosted zone ID"
  value       = aws_cloudfront_distribution.s3_distribution.hosted_zone_id
}

output "cloudfront_origin_access_identity_iam_arn" {
  description = "The IAM ARN of the CloudFront Origin Access Identity"
  value       = aws_cloudfront_origin_access_identity.s3_identity.iam_arn
}