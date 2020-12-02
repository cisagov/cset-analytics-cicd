locals {
  api_name               = "${var.app}-${var.env}-api"
  api_container_port     = 80
  api_container_protocol = "HTTP"
  api_container_name     = "${var.app}-api"

  api_environment = {
    "DB_HOST" : module.documentdb.endpoint,
    "DB_PORT" : 27017,
    "DB_PARAMS" : "?authSource=admin&ssl=true&readpreference=primary&tlsInsecure=true",
    "DB_PW" : aws_ssm_parameter.docdb_password.value,
    "DB_USER" : aws_ssm_parameter.docdb_username.value,
    "MONGO_TYPE" : "DOCUMENTDB",
    "COGNITO_REGION" : var.region,
    "COGNITO_POOL_ID" : aws_cognito_user_pool.pool.id,
    "COGNITO_CLIENT_ID" : aws_cognito_user_pool_client.client.id,
    "CORS_CSET_ORIGINS" : "https://${aws_route53_record.domain.name},https://${module.alb.alb_dns_name},https://*.${var.route53_zone_name}"
  }

  ui_name = "${var.app}-${var.env}-ui"
  ui_container_name = "${var.app}-ui"
  ui_container_port = 80
  ui_container_protocol = "HTTP"
  ui_environment = {
    "API_URL" : "https://${aws_route53_record.domain.name}/api/"
  }
}
