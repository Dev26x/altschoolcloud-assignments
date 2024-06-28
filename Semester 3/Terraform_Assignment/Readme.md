# Hakeem Altschool Static Website Infrastructure With Terraform and Route53

## Project Summary
This project establishes a robust and scalable infrastructure on Amazon Web Services (AWS) to host a static website for Hakeem Altschool. This infrastructure leverages the following services:

Amazon S3: Provides secure and reliable storage for website assets.
Amazon CloudFront: Enables efficient global content delivery with low latency.
Amazon API Gateway (Optional): Facilitates programmatic access to website content if required.
AWS Identity and Access Management (IAM): Implements granular access control for enhanced security.
Terraform: Streamlines infrastructure deployment and management through infrastructure as code (IaC).
By utilizing these services, the project delivers a highly available, performant, and secure foundation for Hakeem Altschool's website. This infrastructure allows for effortless content updates and simplifies future website management.

## Prerequisites
Before you begin, ensure you have the following:
- AWS CLI installed and configured with appropriate credentials
- Terraform installed (version 1.2.0 or later)
- A registered domain name (dev26x.com.ng in this case)
- An SSL certificate for your domain in AWS Certificate Manager
- Visual Studio Code (VSCode) IDE

Project Structure

```
Terraform_Assignment/
├── modules/
│   ├── s3_bucket/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── cloudfront/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── iam/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── route53/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
├── main.tf
├── variables.tf
├── certificate.tf
├── output.tf
├── init.tf
├── data.tf
├── api_gateway_config.tf
├── api_gateway_resource.tf
└── README.md
```


## Root Directory Configuration

main.tf

This file serves as the entry point for our Terraform configuration, orchestrating all the modules:

S3 Bucket Module:

- Creates and configures the S3 bucket for storing website content

- Uses variables for bucket name and environment

CloudFront Module:

- Sets up a CloudFront distribution for content delivery

- Depends on the S3 bucket module

- Uses outputs from the S3 module for configuration

IAM Module:

- Creates necessary IAM roles and policies

- Uses the S3 bucket ARN for permissions

init.tf

- Sets up the Terraform configuration:

- Specifies required Terraform version

- Defines required AWS provider version

- Configures the AWS provider with the specified region


data.tf

Fetches dynamic data from AWS:

- Current AWS account information

- Available AWS availability zones in the region

This data can be used throughout the Terraform configuration for dynamic resource creation and configuration.

certificate.tf 

Contains a data block that retrieves an existing AWS Certificate Manager (ACM) certificate. This is useful in this project because I created and validated my certificate on the aws console outside of Terraform, and needed to reference the SSL/TLS certificate.

## Modules

### S3 Bucket Module

Purpose:
The s3_bucket module is responsible for creating an Amazon S3 bucket. This bucket is used to store and serve the files for the static website for Hakeem Altschool.

### CloudFront Module
In this module, I set up Amazon CloudFront to work with the S3 bucket, creating a content delivery network for our static website. 

Outputs
cloudfront_domain_name: The domain name of our CloudFront distribution
cloudfront_hosted_zone_id: The hosted zone ID of the distribution

### IAM Module
Within this module, I set up the necessary IAM (Identity and Access Management) resources to manage permissions for the project. It grants specific permissions to interact with our S3 bucket.

### Route 53 Module
Within this module, I set up Amazon Route 53 to manage the DNS for the project. 


### Deployment

To deploy the infrastructure:

Run the following commands: 

```
terraform init

terraform plan

terraform apply
```

terraform init: initializes the Terraform working directory.

terraform plan: reviews the planned changes.

terraform apply: apply the changes.

*My variables are alllocated in my terraform.tfvars file which i used gitignore to avoid pushing to my git repo.*

## Results of terraform configuration

cloudfront distribution
![cloudfront](<../images/Screenshot 2024-06-28 at 19.55.10.png>)


custom domain
![Alt text](<../images/Screenshot 2024-06-28 at 18.58.18.png>)


terraform apply ran successfully
![Alt text](<../images/Screenshot 2024-06-28 at 19.49.49.png>)


s3 bucket provisioned
![Alt text](<../images/Screenshot 2024-06-28 at 19.51.51.png>)


static website files uploaded successfully
![Alt text](<../images/Screenshot 2024-06-28 at 19.51.59.png>)


route53 hosted zone
![Alt text](<../images/Screenshot 2024-06-28 at 19.52.32.png>)


ssl certificate
![Alt text](<../images/Screenshot 2024-06-28 at 19.53.01.png>)

