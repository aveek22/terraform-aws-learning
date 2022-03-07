resource "aws_iam_role_policy" "terraform_test_policy_lambda_2" {
  name = "terraform_test_policy_lambda_2"
  role = aws_iam_role.terraform_test_role_lambda_2.id

  policy = file("../terraform/lambda-2/iam-role/lambda-policy.json")
}

resource "aws_iam_role" "terraform_test_role_lambda_2" {
  name = "terraform_test_role_lambda_2"
  assume_role_policy = file("../terraform/lambda-2/iam-role/lambda-assume-policy.json")
}