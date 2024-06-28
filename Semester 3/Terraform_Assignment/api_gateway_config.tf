# resource "aws_api_gateway_rest_api" "hakeem_altschool_api" {
#   name        = "hakeem-altschool-api"
#   description = "API Gateway for Hakeem Altschool"
# }

# resource "aws_api_gateway_deployment" "hakeem_altschool_deployment" {
#   depends_on  = [aws_api_gateway_integration.s3_integration]
#   rest_api_id = aws_api_gateway_rest_api.hakeem_altschool_api.id
#   stage_name  = var.environment
# }