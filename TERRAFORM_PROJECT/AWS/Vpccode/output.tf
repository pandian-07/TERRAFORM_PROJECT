output "aws_vpc_id" {
    value = aws_vpc.tera_vpc.id
}
output "aws_subnet_id" {
    value = aws_subnet.tera_Subnet1.id
  
}
output "aws_vpc_ins_id" {
    value = aws_instance.tera_ins.id
  
}