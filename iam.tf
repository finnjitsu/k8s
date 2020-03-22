resource "aws_iam_policy" "web_worker_policy" {
  name        = "${var.stack_name}-web-worker-policy"
  path        = "/serviceRole/"
  description = "Policy for Jenkins services."
  policy      = templatefile("${path.module}/web-worker-policy.tpl",
                             { instance_arn = aws_instance.web_worker_01.arn,
                               region = var.region })
}

resource "aws_iam_role" "web_worker_role" {
  name = "${var.stack_name}-web-worker-role"
  path = "/serviceRole/"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "web_worker_instance_profile" {
  name = "${var.stack_name}-web-worker-instance-profile"
  role = aws_iam_role.web_worker_role.name
}

resource "aws_iam_role_policy_attachment" "web_worker_role_web_worker_policy_attachment" {
  role       = aws_iam_role.web_worker_role.name
  policy_arn = aws_iam_policy.web_worker_policy.arn
}

resource "aws_iam_role_policy_attachment" "web_worker_role_ssm_policy_attachment" {
  role       = aws_iam_role.web_worker_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}