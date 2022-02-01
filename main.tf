resource "time_sleep" "lolkek" {
  create_duration = "60s"
}

provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}
resource "null_resource" "timer" {
depends_on = [time_sleep.lolkek]
 provisioner "local-exec" {

  
   command   = "aws ec2 terminate-instances --instance-ids ${aws_instance.web.id}"
      
 }
}
resource "aws_instance" "web" {

  key_name      = "Endijs" 
  ami           = "ami-00dff27dd99d89d89"
  instance_type = "t3.micro"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"
  user_data     = file("init-script.sh")
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  tags = {
    Name        = "ELinux7"
  }

}


# provisioner "file" {
     
#     source      = "~/rootkey.csv"
#     destination = "/var/log/rootkey.csv"
# }
  
  

  




   





