resource "aws_instance" "docker_instance" {
  ami           = "ami-0ea0f26a6d50850c5"
  instance_type = "t3.micro"
  vpc_security_group_ids =  [aws_security_group.docker_server.id]
  key_name = "ta-eu-west-1-key-pair"
  subnet_id = data.aws_subnet.public.id

  user_data = <<-EOF
   #! /bin/bash
   sudo yum update -y
   sudo yum install -y docker
   sudo service docker start
   sudo usermod -a -G docker ec2-user
   sudo docker pull nginx:latest
   sudo docker run --name mynginx1 -p 80:80 -d nginx

  EOF


  tags = {
    Name = "docker server"
  }
}
