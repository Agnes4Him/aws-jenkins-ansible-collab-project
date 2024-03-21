data "aws_ami" "project_ubuntu_ami" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    owners = ["099720109477"]
}

resource "aws_key_pair" "project_ssh_key" {
    key_name = "server-key"
    public_key = file(var.public_key_location)
}

resource "aws_instance" "jenkins_server" {
    ami = data.aws_ami.project_ubuntu_ami.id
    instance_type = var.instance_type 
    subnet_id = aws_subnet.project_subnet-1.id
    vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
    availability_zone = var.az_1
    associate_public_ip_address = true
    key_name = aws_key_pair.project_ssh_key.key_name
    tags = {
        Name: "jenkins-server"
    }
    /* connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = file(var.private_key_location)
    } */
    user_data = file("./scripts/jenkins-script.sh")
}

resource "aws_instance" "ansible_server" {
    ami = data.aws_ami.project_ubuntu_ami.id
    instance_type = var.instance_type
    subnet_id = aws_subnet.project_subnet-1.id
    vpc_security_group_ids = [aws_security_group.ansible_sg.id]
    availability_zone = var.az_1
    associate_public_ip_address = true
    key_name = aws_key_pair.project_ssh_key.key_name
    tags = {
        Name: "ansible-server"
    }
    /* connection {
        type = "ssh"
        host = self.public_ip
        user = "ubuntu"
        private_key = file(var.private_key_location)
    } */
    user_data = file("./scripts/ansible-script.sh")
}

output "jenkins_server_ip" {
  value = aws_instance.jenkins_server.public_ip
}

output "ansible_server_ip" {
  value = aws_instance.ansible_server.public_ip
}