resource "aws_launch_template" "app" {
  name_prefix = "app"
  image_id = "ami-0557a15b87f6559cf" 
  instance_type = var.instance_type
  network_interfaces {
    security_groups = [ "${aws_security_group.app_sg.id}" ]
  }
}