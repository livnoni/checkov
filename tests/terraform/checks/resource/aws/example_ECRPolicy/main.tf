provider "aws" {
  region = "eu-west-2"
}

resource "aws_ecr_repository" "public" {
  name = "public_repo"
  tags = {
    yor_trace = "8e61acd9-559a-4d07-81d6-528c3335ace1"
  }
}

resource "aws_ecr_repository_policy" "fail" {
  repository = aws_ecr_repository.public.name
  policy     = <<POLICY
{   "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",                
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",                
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",                
                "ecr:DescribeRepositories",                
                "ecr:GetRepositoryPolicy",                
                "ecr:ListImages",                
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",                
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]        
        }   
    ]
    }
POLICY
}

resource "aws_ecr_repository" "private" {
  name = "private_repo"
  tags = {
    yor_trace = "e8069274-2467-4b9f-a68c-fc9980b5002e"
  }
}

resource "aws_ecr_repository_policy" "pass" {
  repository = aws_ecr_repository.private.name
  policy     = <<POLICY
{   "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": {"AWS": [
                "arn:aws:iam::123456789012:user/pull-user-1",
                "arn:aws:iam::123456789012:user/pull-user-2"]},
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",                
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",                
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",                
                "ecr:DescribeRepositories",                
                "ecr:GetRepositoryPolicy",                
                "ecr:ListImages",                
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",                
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]        
        }   
    ]
    }
POLICY
}


resource "aws_ecr_repository" "empty" {
  name = "nopolicy_repo"
  tags = {
    yor_trace = "89ba8e2e-f43c-4187-955c-4efe3bd88f23"
  }
}

resource "aws_ecr_repository_policy" "empty" {
  repository = aws_ecr_repository.empty.name
  policy     = ""
}

resource "aws_ecr_repository" "conditional_ok" {
  name = "conditional_ok_repo"
  tags = {
    yor_trace = "8e63eff8-8619-41a7-b9dd-0b0f946c3975"
  }
}

resource "aws_ecr_repository_policy" "pass_conditional" {
  repository = aws_ecr_repository.conditional_ok.name
  policy     = <<POLICY
{   "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",                
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",                
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",                
                "ecr:DescribeRepositories",                
                "ecr:GetRepositoryPolicy",                
                "ecr:ListImages",                
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",                
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ],        
            "Condition": {
                "ForAllValues:StringEquals": {
                    "aws:PrincipalOrgID": "o-12345678"
                }
            }
        }   
    ]
    }
POLICY
}

resource "aws_ecr_repository" "conditional_bad" {
  name = "conditional_bad_repo"
  tags = {
    yor_trace = "85efb8c2-7a58-4ed8-ae2e-edd854d2e42d"
  }
}

resource "aws_ecr_repository_policy" "fail_conditional" {
  repository = aws_ecr_repository.conditional_bad.name
  policy     = <<POLICY
{   "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",                
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",                
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",                
                "ecr:DescribeRepositories",                
                "ecr:GetRepositoryPolicy",                
                "ecr:ListImages",                
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",                
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ],
            "Condition": {
                "ForAllValues:StringEquals": {
                    "aws:username": "pull-user-1"
                }
            }
        }   
    ]
    }
POLICY
}