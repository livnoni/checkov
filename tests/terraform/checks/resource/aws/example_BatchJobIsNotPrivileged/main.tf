resource "aws_batch_job_definition" "unknown2" {
  name                 = "foobar"
  type                 = "container"
  container_properties = file("${path.module}/job_definition.json")
  tags = {
    yor_trace = "834abc0f-05ce-45e6-af60-7481ef097e71"
  }
}


resource "aws_batch_job_definition" "fail" {
  name = "tf_test_batch_job_definition"
  type = "container"

  container_properties = <<CONTAINER_PROPERTIES
{
    "command": ["ls", "-la"],
    "image": "busybox",
    "memory": 1024,
    "vcpus": 1,
    "privileged": true,
    "volumes": [
      {
        "host": {
          "sourcePath": "/tmp"
        },
        "name": "tmp"
      }
    ],
    "environment": [
        {"name": "VARNAME", "value": "VARVAL"}
    ],
    "mountPoints": [
        {
          "sourceVolume": "tmp",
          "containerPath": "/tmp",
          "readOnly": false
        }
    ],
    "ulimits": [
      {
        "hardLimit": 1024,
        "name": "nofile",
        "softLimit": 1024
      }
    ]
}
CONTAINER_PROPERTIES
  tags = {
    yor_trace = "0f005a67-1caa-41b4-be88-fd8bfa5ca70a"
  }
}



resource "aws_batch_job_definition" "pass" {
  name = "tf_test_batch_job_definition"
  type = "container"

  container_properties = <<CONTAINER_PROPERTIES
{
    "command": ["ls", "-la"],
    "image": "busybox",
    "memory": 1024,
    "vcpus": 1,
    "privileged": false,
    "volumes": [
      {
        "host": {
          "sourcePath": "/tmp"
        },
        "name": "tmp"
      }
    ],
    "environment": [
        {"name": "VARNAME", "value": "VARVAL"}
    ],
    "mountPoints": [
        {
          "sourceVolume": "tmp",
          "containerPath": "/tmp",
          "readOnly": false
        }
    ],
    "ulimits": [
      {
        "hardLimit": 1024,
        "name": "nofile",
        "softLimit": 1024
      }
    ]
}
CONTAINER_PROPERTIES
  tags = {
    yor_trace = "de52840c-a716-4619-81ed-d08107e65a75"
  }
}



resource "aws_batch_job_definition" "unknown" {
  name = "tf_test_batch_job_definition"
  type = "container"
  tags = {
    yor_trace = "74c0e879-5f91-4e73-9de2-04b4edc82126"
  }
}


resource "aws_batch_job_definition" "pass2" {
  name = "tf_test_batch_job_definition"
  type = "container"

  container_properties = <<CONTAINER_PROPERTIES
{
    "command": ["ls", "-la"],
    "image": "busybox",
    "memory": 1024,
    "vcpus": 1,
    "volumes": [
      {
        "host": {
          "sourcePath": "/tmp"
        },
        "name": "tmp"
      }
    ],
    "environment": [
        {"name": "VARNAME", "value": "VARVAL"}
    ],
    "mountPoints": [
        {
          "sourceVolume": "tmp",
          "containerPath": "/tmp",
          "readOnly": false
        }
    ],
    "ulimits": [
      {
        "hardLimit": 1024,
        "name": "nofile",
        "softLimit": 1024
      }
    ]
}
CONTAINER_PROPERTIES
  tags = {
    yor_trace = "4c0b54d4-297c-496d-a8f8-8303ab64a119"
  }
}

resource "aws_batch_job_definition" "pass3" {
  name = "tf_test_batch_job_definition"
  type = "container"

  container_properties = jsonencode({
    "command" : ["ls", "-la"],
    "image" : "busybox",
    "memory" : 1024,
    "vcpus" : 1,
    "volumes" : [
      {
        "host" : {
          "sourcePath" : "/tmp"
        },
        "name" : "tmp"
      }
    ],
    "environment" : [
      { "name" : "VARNAME", "value" : "VARVAL" }
    ],
    "mountPoints" : [
      {
        "sourceVolume" : "tmp",
        "containerPath" : "/tmp",
        "readOnly" : false
      }
    ],
    "ulimits" : [
      {
        "hardLimit" : 1024,
        "name" : "nofile",
        "softLimit" : 1024
      }
    ]
  })
  tags = {
    yor_trace = "b9d0fd22-745e-44d0-8b69-14f5878b8881"
  }
}


