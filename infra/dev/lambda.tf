# use Iam Module
module "iam_role" {
    source = "../modules/iam"
}

resource "aws_lambda_function" "lambda_hello_tf" {
    filename = "../../lambda.zip"
    function_name = var.FUNC_NAME
    description = var.FUNC_DESC
    role = module.iam_role.iam_arn
    handler = "lib/${var.FUNC_NAME}.handler"
    runtime = "nodejs14.x"
    memory_size = 128 # MB
    timeout = 60 # seconds

    source_code_hash = "${filebase64sha256("../../lambda.zip")}"
    depends_on = [
      module.iam_role
    ]
}

output "lambda_func" {
    description = "value of lambda_func"
    value = try(var.FUNC_NAME, "")
}

output "lambda_func_desc" {
    description = "value of lambda_func_desc"
    value = try(var.FUNC_DESC, "")
}