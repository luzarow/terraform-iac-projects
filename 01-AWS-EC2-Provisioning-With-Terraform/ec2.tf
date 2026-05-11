# Create EC2 instance
resource "aws_instance" "terraform_instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.terraform_sg.id
  ]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y httpd
              systemctl start httpd
              systemctl enable httpd

              echo "<h1>Hello from Mateen's Infra Provisioning Terraform!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "terraform-lab-instance"
    Environment = var.environment
  }
} 