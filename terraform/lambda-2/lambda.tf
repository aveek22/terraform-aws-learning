locals {
  lambda-zip-location = "../build/lambda-2/app.zip"
}

data "archive_file" "terraform_lambda_function_lambda_2" {
  type = "zip"
  source_file = "../lambda/lambda-2/app.py"
  output_path = local.lambda-zip-location
}

resource "aws_lambda_function" "terraform_lambda_function_2" {
  filename = local.lambda-zip-location
  function_name = "terraform_lambda_function_2"
  role = aws_iam_role.terraform_test_role_lambda_2.arn
  handler = "app.main"

  runtime = "python3.8"

  environment {
    variables = {
        foo = "bar"
        application_environment = "${var.environment}"
    }
  }
}