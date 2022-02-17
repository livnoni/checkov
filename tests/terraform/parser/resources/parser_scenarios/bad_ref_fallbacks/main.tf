locals {
  BAD_VAR            = var.var_not_there
  BAD_LOCAL          = local.local_not_there
  BAD_MODULE         = module.module_not_there.nope
  BAD_MODULE2        = module.module_not_there
  BAD_MODULE3        = module.module_not_there.nope.still_not
  QUOTE_IN_QUOTE_446 = "${filemd5("${path.module}/templates/some-file.json")}"
}

resource "aws_lambda_function" "test_lambda" {
  source_code_hash = "${filemd5("${path.module}/templates/some-file.json")}"
  tags = {
    yor_trace = "4c94639c-4663-4e3a-b865-50ea567f46fd"
  }
}