terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "my_practice_bucket" {
  bucket = "my-tf-practice-bucket-steve-correa"

}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.my_practice_bucket.id
  policy = <<EOT
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "PublicReadGetObject",
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : [
            "s3:GetObject"
          ],
          "Resource" : [
            "arn:aws:s3:::my-tf-practice-bucket-steve-correa/*"
          ]
        }
      ]
    }
  EOT
}
