locals {
  index_html_file = "index.html"
  error_html_file = "error.html"
}

# create a static web site bucket
module "s3_static_website" {
  source  = "./modules/s3-bucket"
  bucket_name = "my-random-bucket-name"
  website = {
    index_document = local.index_html_file
    error_document = local.error_html_file

# conflicts with "routing_rules"
#    redirect_all_requests_to = {
#      host_name = "https://modules.tf"
#    }
#    routing_rules  = [
#      {
#        condition = {
#          key_prefix_equals = "docs/"
#        },
#        redirect = {
#          replace_key_prefix_with = "documents/"
#        }
#      },
#      {
#        condition = {
#          http_error_code_returned_equals = 404
#          key_prefix_equals               = "archive/"
#        },
#        redirect = {
#          host_name          = "archive.myhost.com"
#          http_redirect_code = 301
#          protocol           = "https"
#          replace_key_with   = "not_found.html"
#        }
#      }
#    ]
  }
}

# upload the index and error html files
resource "aws_s3_object" "index" {
  bucket       = module.s3_static_website[0].bucket_id
  key          = local.index_html_file
  source       = local.index_html_file
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = module.s3_static_website[0].bucket_id
  key          = local.error_html_file
  source       = local.error_html_file
  acl          = "public-read"
  content_type = "text/html"
}
