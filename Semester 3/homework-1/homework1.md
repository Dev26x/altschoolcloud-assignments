# Static Website Hosting on S3 Bucket with CloudFront CDN

## Objective
This is a guide for creating a static website hosted on an S3 bucket with a public read policy assigned which also utilized CloudFront as a CDN to deliver content efficiently.


## Steps

### 1. Create an S3 Bucket
- Log in to the AWS Management Console.
- Navigate to the S3 service.
- Click on "Create bucket".
- Follow the prompts to create a new bucket.
- Choose the name of the bucket that you want to enable static website hosting for.
- Click on create bucket

![s3 bucket created after the following the steps above](<images-hw1/Screenshot 2024-05-11 at 09.31.42.png>)




### 2. Upload Website Content to S3 Bucket
- Upload your website files (html, CSS, JavaScript, images, etc.) to the S3 bucket.

![hyperlink shown on the upload of website](<images-hw1/Screenshot 2024-05-11 at 09.34.53.png>)


### 3. Configure CloudFront Distribution
- Navigate to the CloudFront service.
- Click on "Create Distribution".
- In the "Origin Domain Name", select your S3 bucket from the dropdown.

![creat distribution](<images-hw1/Screenshot 2024-05-11 at 09.41.49.png>)

- Enter name for this origin, select your S3 bucket name
- Origin Access, in the dropdown menu select: Origin access control settings (recommended)

![create a new Origin Access Control](<images-hw1/Screenshot 2024-05-11 at 09.41.29.png>)

- Configure other settings as needed.
- Under the "Default root object", type `index.html` which it is already created as a file in the S3 bucket. 
- Click on "Create Distribution".
- Status of the distrubtion would be seen as "Enabled" if it was created successfully.

![Distribution created successfully](<images-hw1/Screenshot 2024-05-11 at 09.38.33.png>)

- Upon successful creation of distribution, S3 bucket policy needs to be updated by coping the policy provided in the distribution to use it in the S3 bucket


### 4. Configure S3 Bucket Policy for Public Read Access
- Navigate to the S3
- Select the name of the bucket created.
- Select the "Permissions" tab.
- Click on edit button on "Bucket Policy" to paste the policy copied from the distribution:

![success](<images-hw1/Screenshot 2024-05-11 at 09.37.01.png>)

```json
{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "AllowCloudFrontServicePrincipal",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::althomework/*",
            "Condition": {
                "StringEquals": {
                    "AWS:SourceArn": "arn:aws:cloudfront::053022822739:distribution/EB6RV2FI6L2ZD"
                }
            }
        }
    ]
}
```
- Save changes
![After changes have been made](/images/s3_bucket_policy_configuration.png)

### 6. Testing/Verification of URL
- Once the CloudFront distribution is deployed and your S3 bucket policy has been successfully updated, access your website using the CloudFront domain name.
`https://d385st5903we9e.cloudfront.net`

![static website is live](<images-hw1/Screenshot 2024-05-11 at 09.39.05.png>)

### Conclusion

You have successfully created a static website hosted on an S3 bucket with public read access as it utilizes the CloudFront as a CDN for faster content delivery.