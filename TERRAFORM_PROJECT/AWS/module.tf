module "aws_s3_bucket" {
    source = "./S3code" 
}
  
module "aws_vpc" {
    source = "./Vpccode" 
}
module "aws_instace"{
    source = "./Ec2code"    
} 
module "aws_iam_user"{
    source = "./Iamcode"
}
 

