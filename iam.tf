
 resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = "${aws_iam_role.ec2_role.name}"
}
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"

    assume_role_policy = "${file("ec2-assume.json")}"
    
      inline_policy {
         name = "ec2_policy"
         policy = "${file("ex2-policy.json")}"

     }

  }
 