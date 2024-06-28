variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the website"
  type        = string
}

variable "hosted_zone_id" {
  description = "The Route 53 hosted zone ID"
  type        = string
}

variable "certificate_arn" {
  description = "The ARN of the SSL certificate"
  type        = string
}