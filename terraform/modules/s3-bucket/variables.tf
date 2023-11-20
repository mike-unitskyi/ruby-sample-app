variable "bucket_name" {
  description = "The name of the bucket without the www. prefix. Normally domain_name."
  type        = string
}

variable "website" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = any
  default     = {}
}

variable "tags" {
  description = "Common tags you want applied to resources."
  type        = map(string)
  default     = {}
}
