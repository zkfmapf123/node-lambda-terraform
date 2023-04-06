# Node + Lambda + Terraform Template

## Problem

- [x] 각각의 함수마다 State가 관리가 되어야 함 -> terraform workspace로 관리

## 사용방법

![arhc](./public/arch.jpg)

```
    // 0. setting alias
    source alias.sh

    // 1. build
    tsc -p src/hello/tsconfig.json && tsc-alias
    npm run zip

    // 2. setting infra
    cd infra/dev or cd infra/prod
    terraform workspace new hello or terraform workspace select hello
    terraform workspace show

    // 3. apply infra
    terraform init
    terraform plan
    terraform apply

    // 4. destroy
    terraform destroy

```

## Desc

- [x] Terraform
- [x] Lambda
- [x] Cloud-watch
- [ ] API-Gateway
- [ ] Kinesis
- [ ] SNS
- [ ] SQS
- [ ] Aurora-Serverless

<!-- - [ ] AWS CodePipeline
- [ ] AWS CloudFormation
- [ ] AWS CodeBuild -->

## Folder

> common

    - 공통 모듈을 관리하는 폴더입니다

> src

    - labmda 함수가 위치하는 폴더입니다.

> infra

    - Terraform File 입니다

## Reference

- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function
