# no blocks
resource "aws_imagebuilder_image_recipe" "pass" {
  #   block_device_mapping {
  #     device_name = "/dev/xvdb"

  #     ebs {
  #     #   encrypted             = true
  #     #   kms_key_id            = aws_kms_key.fail.arn
  #       delete_on_termination = true
  #       volume_size           = 100
  #       volume_type           = "gp2"
  #     }
  #   }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags = {
    yor_trace = "ba0b6c57-2f0c-44d5-99a8-c948f477adcf"
  }
}

#happy path
resource "aws_imagebuilder_image_recipe" "pass2" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      encrypted             = true
      kms_key_id            = aws_kms_key.fail.arn
      delete_on_termination = true
      volume_size           = 100
      volume_type           = "gp2"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags = {
    yor_trace = "96afc954-8a8a-48ee-b891-5e77dce17cc2"
  }
}

#no ebs
resource "aws_imagebuilder_image_recipe" "pass3" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    #     ebs {
    #     #   encrypted             = true
    #     #   kms_key_id            = aws_kms_key.fail.arn
    #       delete_on_termination = true
    #       volume_size           = 100
    #       volume_type           = "gp2"
    #     }
  }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags = {
    yor_trace = "7c9b427f-ab40-49a8-976f-bef60aba5795"
  }
}

#nothing set
resource "aws_imagebuilder_image_recipe" "fail" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      #   encrypted             = true
      #   kms_key_id            = aws_kms_key.fail.arn
      delete_on_termination = true
      volume_size           = 100
      volume_type           = "gp2"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags = {
    yor_trace = "5f596abe-8740-4f90-ada9-d9279c9b0da0"
  }
}

#no kms key
resource "aws_imagebuilder_image_recipe" "fail2" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      encrypted = true
      #   kms_key_id            = aws_kms_key.fail.arn
      delete_on_termination = true
      volume_size           = 100
      volume_type           = "gp2"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags = {
    yor_trace = "d4e2059d-543b-4761-9949-c1316a5e8096"
  }
}

#not encrypted
resource "aws_imagebuilder_image_recipe" "fail3" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      #   encrypted             = true
      kms_key_id            = aws_kms_key.fail.arn
      delete_on_termination = true
      volume_size           = 100
      volume_type           = "gp2"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags = {
    yor_trace = "d2221f98-7ecd-469d-9385-2d748122570b"
  }
}



data "aws_partition" "current" {}
data "aws_region" "current" {}

resource "aws_kms_key" "fail" {

  tags = {
    yor_trace = "e1e6b8c4-c4ce-4d81-830b-47ef16c63b8b"
  }
}


resource "aws_imagebuilder_component" "fail" {
  data = yamlencode({
    phases = [{
      name = "build"
      steps = [{
        action = "ExecuteBash"
        inputs = {
          commands = ["echo 'hello world'"]
        }
        name      = "example"
        onFailure = "Continue"
      }]
    }]
    schemaVersion = 1.0
  })
  name     = "examplea"
  platform = "Linux"
  version  = "1.0.0"
  tags = {
    yor_trace = "38743220-6690-43e1-b615-80fcdfc9789f"
  }
}

resource "aws_imagebuilder_image_recipe" "fail4" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      encrypted             = true
      kms_key_id            = aws_kms_key.fail.arn
      delete_on_termination = true
      volume_size           = 100
      volume_type           = "gp2"
    }
  }

  block_device_mapping {
    device_name = "/dev/xvdc"

    ebs {
      delete_on_termination = true
      volume_size           = 100
      volume_type           = "gp2"
    }
  }

  component {
    component_arn = aws_imagebuilder_component.fail.arn
  }

  name         = "example"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/amazon-linux-2-x86/x.x.x"
  version      = "1.0.0"
  tags = {
    yor_trace = "c8888d96-93dd-455c-80f9-da961c0af956"
  }
}


provider "aws" {
  region = "eu-west-1"
}