
# Get the default AWS VPC
data "aws_vpc" "default" {
  default = true
}

# Find the latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Allow web traffic
resource "aws_security_group" "cloudpilot_sg" {
  name        = "cloudpilot-security-group"
  description = "Allow HTTP traffic to CloudPilot"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "CloudPilot-Security-Group"
  }
}

# Create EC2 instance
resource "aws_instance" "cloudpilot" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.cloudpilot_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    dnf install -y docker
    systemctl enable docker
    systemctl start docker
    docker run -d --restart unless-stopped -p 80:80 prameelarani0712/cloudpilot:latest
  EOF

  user_data_replace_on_change = true

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name        = "CloudPilot-EC2"
    Project     = "CloudPilot"
    Environment = "Development"
  }
}
