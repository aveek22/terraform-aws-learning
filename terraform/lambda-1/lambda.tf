locals {
  lambda-zip-location = "../build/lambda-1/app.zip"
}

data "archive_file" "terraform_lambda_function" {
  type = "zip"
  source_file = "../lambda/lambda-1/app.py"
  output_path = local.lambda-zip-location
}

resource "aws_lambda_function" "terraform_lambda_function" {
  filename = local.lambda-zip-location
  function_name = "terraform_lambda_function"
  role = aws_iam_role.terraform_test_role_lambda_1.arn
  handler = "app.main"

  runtime = "python3.9"

  environment {
    variables = {
        foo = "bar"
        application_environment = "${var.environment}"
    }
  }
}