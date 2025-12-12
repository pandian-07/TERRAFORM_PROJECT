output "aws_vpc_id" {
    value = module.aws_vpc.aws_vpc_id
}
output "aws_subnet_id" {
    value = module.aws_vpc.aws_subnet_id
}
output "aws_vpc_ins_id" {
    value = module.aws_vpc.aws_vpc_ins_id 
}
output "aws_instace_id" {
    value = module.aws_instance_id 
}
output "aws_s3_bucket_id" {
    value = module.aws_s3_bucket.aws_s3_bucket_id
}
output "aws_iam_user_id" {
    value = module.aws_iam_user.aws_iam_user_id
  
}