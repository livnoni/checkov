resource "aws_mq_broker" "unknown" {
  broker_name = "example"

  engine_type         = "ActiveMQ"
  engine_version      = var.engine_version
  host_instance_type  = "mq.t2.micro"
  publicly_accessible = true
  deployment_mode     = "SINGLE_INSTANCE"
  # auto_minor_version_upgrade = true
  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }
  tags = {
    yor_trace = "4c8f85c9-fcd6-4520-bf5c-555905d801da"
  }
}


resource "aws_mq_broker" "fail" {
  broker_name = "example"

  engine_type         = "ActiveMQ"
  engine_version      = "5.15.0"
  host_instance_type  = "mq.t2.micro"
  publicly_accessible = true
  deployment_mode     = "SINGLE_INSTANCE"
  # auto_minor_version_upgrade = true
  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # publicly_accessible = true
  tags = {
    yor_trace = "88c2a594-758a-46fa-a885-1610e8a1db3c"
  }
}

resource "aws_mq_broker" "pass" {
  broker_name = "example"

  engine_type         = "ActiveMQ"
  engine_version      = "5.16.0"
  host_instance_type  = "mq.t2.micro"
  publicly_accessible = true
  deployment_mode     = "SINGLE_INSTANCE"
  # auto_minor_version_upgrade = true
  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # publicly_accessible = true
  tags = {
    yor_trace = "70414cdf-6bef-46d6-a48b-ba70ea9990dd"
  }
}

resource "aws_mq_broker" "pass2" {
  broker_name = "example"

  engine_type         = "RabbitMQ"
  engine_version      = "3.8.6"
  host_instance_type  = "mq.t2.micro"
  publicly_accessible = true
  deployment_mode     = "SINGLE_INSTANCE"
  # auto_minor_version_upgrade = true
  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # publicly_accessible = true
  tags = {
    yor_trace = "64878000-1033-4597-9b5d-d17cdf6fbb7a"
  }
}

#no failing major versions yet
resource "aws_mq_broker" "fail2" {
  broker_name = "example"

  engine_type         = "RabbitMQ"
  engine_version      = "3.7.6"
  host_instance_type  = "mq.t2.micro"
  publicly_accessible = true
  deployment_mode     = "SINGLE_INSTANCE"
  # auto_minor_version_upgrade = true
  user {
    username = "ExampleUser"
    password = "MindTheGapps"
  }

  # publicly_accessible = true
  tags = {
    yor_trace = "3c822b79-656d-422b-ad10-6a1905e7e1ca"
  }
}

resource "aws_mq_configuration" "fail" {
  description    = "Example Configuration"
  name           = "example"
  engine_type    = "ActiveMQ"
  engine_version = "5.15.0"

  data = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA
  tags = {
    yor_trace = "34cbebfb-124b-4d68-b895-a8284e0996d3"
  }
}

resource "aws_mq_configuration" "pass" {
  description    = "Example Configuration"
  name           = "example"
  engine_type    = "ActiveMQ"
  engine_version = "5.16.3"

  data = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA
  tags = {
    yor_trace = "9de39e4b-6b09-4936-a9ca-0759a9ae004d"
  }
}


