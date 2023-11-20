output "s3_bucket_id" {
  description = "The name of the bucket."
  value       = try(aws_s3_bucket.bucket[0].id, "")
}

output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value       = try(aws_s3_bucket.bucket[0].arn, "")
}

output "s3_bucket_website_endpoint" {
  description = "The website endpoint, if the bucket is configured with a website. If not, this will be an empty string."
  value       = try(aws_s3_bucket_website_configuration.website[0].website_endpoint, "")
}

output "s3_bucket_website_domain" {
  description = "The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records."
  value       = try(aws_s3_bucket_website_configuration.website[0].website_domain, "")
}
