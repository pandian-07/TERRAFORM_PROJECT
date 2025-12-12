provider "aws" {
    region = "ap-southeast-2"

}
terraform {
  backend "s3" {
    bucket = "terabackend123"
    key = "statefile"
    region = "ap-southeast-2"
    
  }
}
