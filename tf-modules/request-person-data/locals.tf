locals {
  aws_iam_lambda_policy    = join("-", [var.service_name, "iam", var.app_env, "lambda-policy", var.module_name])
  aws_iam_role_name        = join("-", [var.service_name, "iam", var.app_env, "execution-role", var.module_name])
  aws_lambda_function_name = join("-", [var.service_name, "lambda", var.app_env, "function", var.module_name])
}
