resource "aws_instance" "test" {
  ami                    = "ami-05f020f5935e52dc4"
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_security_group.selected.id]
}

resource "null_resource" "provisioner" {
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = aws_instance.test.public_ip
    }

    inline = [
      "sudo dnf install nginx",
      "sudo systemctl start nginx}",
    ]
  }
}

data "aws_security_group" "selected" {
  name = "allow-all"
}


