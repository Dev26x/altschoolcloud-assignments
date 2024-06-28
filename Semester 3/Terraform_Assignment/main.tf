module "s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.bucket_name
  environment = var.environment
}

module "cloudfront" {
  source                      = "./modules/cloudfront"
  environment                 = var.environment
  bucket_name                 = module.s3_bucket.bucket_name
  bucket_regional_domain_name = module.s3_bucket.bucket_regional_domain_name
  bucket_arn                  = module.s3_bucket.bucket_arn
  domain_name                 = var.domain_name
  certificate_arn             = var.certificate_arn
  depends_on                  = [module.s3_bucket]
}

module "route53" {
  source                    = "./modules/route53"
  domain_name               = var.domain_name
  cloudfront_domain_name    = module.cloudfront.cloudfront_domain_name
  cloudfront_hosted_zone_id = module.cloudfront.cloudfront_hosted_zone_id
  hosted_zone_id            = var.hosted_zone_id
}

module "iam" {
  source        = "./modules/iam"
  s3_bucket_arn = module.s3_bucket.bucket_arn
}

# module "api_gateway" {
#   source        = "./modules/api-gateway"
#   aws_region    = var.aws_region
#   bucket_name   = module.s3_bucket.bucket_name
#   iam_role_arn  = module.iam.iam_role_arn
#   environment   = var.environment
# }