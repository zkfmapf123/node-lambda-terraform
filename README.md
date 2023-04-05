# Node + Lambda + Terraform Template

## Images

![arhc](./public/arch.jpg)

## Process

```
    npm run zip-test

    cd infra/dev or infra.prod
    make plan
    make apply
```

## Folder

> common

    - 공통 모듈을 관리하는 폴더입니다

> src

    - labmda 함수가 위치하는 폴더입니다.

> infra

    - Terraform File 입니다

## Reference

- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function
