output "s3_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
  value = module.s3_bucket.s3_bucket_arn
}
output "s3_bucket_domain_name" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value = module.s3_bucket.s3_bucket_bucket_domain_name
}
output "s3_bucket_regional_domain_name" {
  description = "The bucket region-specific domain name."
  value = module.s3_bucket.s3_bucket_bucket_regional_domain_name
}
output "s3_bucket_region" {
  description = "The AWS region this bucket resides in."
  value = module.s3_bucket.s3_bucket_region
}