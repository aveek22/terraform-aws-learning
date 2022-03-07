resource "aws_iam_role_policy" "terraform_test_policy" {
  name = "terraform_test_policy"
  role = aws_iam_role.terraform_test_role.id

  policy = file("../terraform/lambda-1/iam-role/lambda-policy.json")
}

resource "aws_iam_role" "terraform_test_role" {
  name = "terraform_test_role"
  assume_role_policy = file("../terraform/lambda-1/iam-role/lambda-assume-policy.json")
}