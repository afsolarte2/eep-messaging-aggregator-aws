data "archive_file" "lambda_zip" {
    type        = "zip"
    source_dir  = "./lambda-functions/${var.module_name}"
    output_path = "./output/${var.module_name}.zip"
}

resource "aws_lambda_function" "request_personal_data" {
  filename          = "./output/${var.module_name}.zip"
  function_name     = local.aws_lambda_function_name
  role              = aws_iam_role.iam_role_lambda.arn
  handler           = "${local.aws_lambda_function_name}/main.handler"
  source_code_hash  = data.archive_file.lambda_zip.output_base64sha256
  runtime           = "nodejs12.x"
}
