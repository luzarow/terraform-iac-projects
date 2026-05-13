module "vpc" {
  source = "../../modules/vpc"

  project_name = "tf-project"
  environment  = "dev"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]
}

module "sg" {
  source = "../../modules/security-group"

  project_name = "tf-project"
  environment  = "dev"

  vpc_id = module.vpc.vpc_id

  sg_name       = "web-sg"
  allowed_ports = [22, 80]
}

module "ec2" {
  source = "../../modules/ec2"

  project_name = "tf-project"
  environment  = "dev"

  instance_name = "web-server"
  instance_type = "t2.micro"

  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.sg.security_group_id

  key_name = "your-key-name"
}

module "s3" {
  source = "../../modules/s3"

  bucket_name = "tf-project-dev-bucket-12345"
  environment = "dev"
}