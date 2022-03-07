locals {
  lambda-zip-location = "../build/app.zip"
}

resource "archive_file" "init" {
  type = "zip"
  source_file = "../lambda/app.py"
  output_path = local.lambda-zip-location
}

resource "aws_lambda_function" "terraform_lambda_function" {
  filename = local.lambda-zip-location
  function_name = "terraform_lambda_function"
  role = aws_iam_role.terraform_test_role.arn
  handler = "app.main"

  runtime = "python3.7"

  environment {
    variables = {
        foo = "bar"
    }
  }
}