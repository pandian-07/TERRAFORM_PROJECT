resource "aws_instance" "tera_ins1" {
    ami = "ami-007e5a061b93ceb2f"  #should be the regions ami
    instance_type = "t3.micro"
    #count = 2      # to create multiple instance
    tags = {
      Name ="tera_ins1"
    }
}
