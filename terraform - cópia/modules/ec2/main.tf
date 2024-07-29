resource "aws_instance" "instance-wp" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }

  user_data = <<-EOF
            #!/bin/bash
            yum install -y httpd mysql
            systemctl start httpd
            systemctl enable httpd
            yum install -y php php-mysqlnd
            wget https://wordpress.org/latest.tar.gz
            tar -xzf latest.tar.gz
            cp -r wordpress/* /var/www/html/
            chown -R apache:apache /var/www/html/*
            systemctl restart httpd
            mysql -u root -p ${var.db_password} -e "CREATE DATABASE wordpress;"
            EOF
}