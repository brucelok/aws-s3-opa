terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
  }
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name please"
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}
