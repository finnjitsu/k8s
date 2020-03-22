/*******************************************************************************
*                                                                              *
* EC2 Instances                                                                *
*                                                                              *
*******************************************************************************/

data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = [ "amzn2-ami-hvm-2*" ]
  }

  filter {
    name   = "virtualization-type"
    values = [ "hvm" ]
  }

  owners = [ "137112412989" ] # Amazon

}

/*resource "aws_instance" "app_worker_01" {
  ami                    = data.aws_ami.amzn2.id
  instance_type          = var.ec2_instance_type
  availability_zone      = "${var.region}a"
  subnet_id              = var.app_subnet_a_id
  tags = {
    Name = "${var.stack_name}-app-worker-01"
  }
}*/

resource "aws_instance" "web_worker_01" {
  ami                    = data.aws_ami.amzn2.id
  instance_type          = var.ec2_instance_type
  availability_zone      = "${var.region}a"
  subnet_id              = var.web_subnet_a_id
  tags = {
    Name = "${var.stack_name}-web-worker-01"
  }
}