resource "aws_s3_bucket" "tera_buc" {
    bucket = "terabuc123"
  
}
output "aws_s3_bucket" {
    value = aws_s3_bucket.tera_buc.id
  
}