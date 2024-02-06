module "catalogue_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id
  instance_type = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_sg_id.value]
  # it should be in roboshop DB subnet
  subnet_id = element(split(",",data.aws_ssm_parameter.private_subnet_ids.value),0)
  //user_data = file("catalogue.sh")
  #this is optional, if we dont give this will be provisioned inside default subnet of default vpc
  #subnet_id = local.public_subnet_ids[0] # public subnet of default VPC
  tags = merge(
    {
        Name = "catalogue-DEV-AMI"
    },
    var.common_tags
  )
}