resource "aws_iam_role" "iam_role_lambda" {
  name               = local.aws_iam_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "iam_lambda_policy" {
  name   = local.aws_iam_lambda_policy
  policy = data.aws_iam_policy_document.lambda_access_policy.json
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment_lambda_to_default" {
  role       = aws_iam_role.iam_role_lambda.name
  policy_arn = aws_iam_policy.iam_lambda_policy.arn
}
