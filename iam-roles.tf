resource "aws_iam_role_policy_attachment" "s3_full_read_only_access_policy" {
  role = "${aws_iam_role.redshift_role.id}"
  policy_arn = "arn:aws-cn:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "s3_glue_access_policy" {
  role = "${aws_iam_role.redshift_role.id}"
  policy_arn = "arn:aws-cn:iam::aws:policy/AWSGlueConsoleFullAccess"
}


resource "aws_iam_role" "redshift_role" {
  name = "redshift_role"
  assume_role_policy = jsonencode({
    Version: "2012-10-17",
    Statement : [
      {
        Effect = "Allow"
        Principal = {
          "Service" = "redshift.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}