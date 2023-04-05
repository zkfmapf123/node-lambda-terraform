variable "iam_name" {
    type = string   
    default = "iam_lambda"
}

variable "ASSUME_ROLE_POLICY" {
    type = string
    
    default = <<EOF
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

variable "LAMBDA_LOGGING_POLICY" {
  type = string

  default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

# Lambda IAM Role
resource "aws_iam_role" "iam_lambda" {
    name = var.iam_name
    assume_role_policy = var.ASSUME_ROLE_POLICY
}

# Lambda Policy Logging Role
resource "aws_iam_policy" "lambda_logging" {
    name = "lambda_logging"
    path = "/"
    description = "IAM policy for Lambda logging"

    policy = var.LAMBDA_LOGGING_POLICY
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
    role = aws_iam_role.iam_lambda.name
    policy_arn = aws_iam_policy.lambda_logging.arn
    depends_on = [
        aws_iam_role_policy_attachment.lambda_logs,
        aws_iam_policy.lambda_logging,
        aws_iam_role.iam_lambda
    ]
}

output "iam_arn" {
    description = "value of iam_arn"
    value = aws_iam_role.iam_lambda.arn
}

output "policy_arn" {
    description = "value of policy_arn"
    value = aws_iam_policy.lambda_logging.arn
}