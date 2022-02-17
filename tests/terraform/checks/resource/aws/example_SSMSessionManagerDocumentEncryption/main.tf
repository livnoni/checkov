# pass

resource "aws_ssm_document" "enabled" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "${var.kms_key_id}",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "20425eba-daa3-4e65-8e6d-8929ac182794"
  }
}

resource "aws_ssm_document" "enabled_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: ''
    s3KeyPrefix: ''
    s3EncryptionEnabled: true
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: '${var.kms_key_id}'
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "f8326a3a-329a-43ff-8ad0-08b11f15ead2"
  }
}

# failure

resource "aws_ssm_document" "disabled" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  content = <<DOC
  {
    "schemaVersion": "1.0",
    "description": "Document to hold regional settings for Session Manager",
    "sessionType": "Standard_Stream",
    "inputs": {
      "s3BucketName": "",
      "s3KeyPrefix": "",
      "s3EncryptionEnabled": true,
      "cloudWatchLogGroupName": "",
      "cloudWatchEncryptionEnabled": true,
      "idleSessionTimeout": "20",
      "cloudWatchStreamingEnabled": true,
      "kmsKeyId": "",
      "runAsEnabled": false,
      "runAsDefaultUser": "",
      "shellProfile": {
        "windows": "",
        "linux": ""
      }
    }
  }
DOC
  tags = {
    yor_trace = "ba27ccf1-3257-4939-b9b3-4d899a839c9d"
  }
}

resource "aws_ssm_document" "disabled_yaml" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"

  document_format = "YAML"

  content = <<DOC
  schemaVersion: '1.0'
  description: Document to hold regional settings for Session Manager
  sessionType: Standard_Stream
  inputs:
    s3BucketName: ''
    s3KeyPrefix: ''
    s3EncryptionEnabled: true
    cloudWatchLogGroupName: ''
    cloudWatchEncryptionEnabled: true
    cloudWatchStreamingEnabled: true
    kmsKeyId: ''
    runAsEnabled: true
    runAsDefaultUser: ''
    idleSessionTimeout: '20'
    shellProfile:
      windows: ''
      linux: ''
DOC
  tags = {
    yor_trace = "c0cc8b83-b51b-47ff-b0b0-2be7b114c94f"
  }
}
