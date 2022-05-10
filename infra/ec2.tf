resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id #ami-005de95e8ff495156
  instance_type = var.instance_type
  tags = var.ec2_tags
  subnet_id = var.subnet_id
  associate_public_ip_address = var.public_ip
  security_groups = [aws_security_group.ec2_public_security_group.id]
  key_name = var.key_pair_name
  user_data = "${file("../infra/user_data.sh")}" #context where is executed
}