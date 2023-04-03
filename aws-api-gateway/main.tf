variable "routes" {
  type        = list(object({
    path          = string
    http_method   = string
    authorization = string
    target_url    = string
  }))
}

resource "aws_api_gateway_rest_api" "example" {
  name        = "api_gateway_example"
  description = "API Gateway Example"
}

resource "aws_api_gateway_resource" "api" {
  rest_api_id = aws_api_gateway_rest_api.example.id
  parent_id   = aws_api_gateway_rest_api.example.root_resource_id
  path_part   = "api"
}

resource "aws_api_gateway_method" "api" {
  for_each     = { for route in var.routes : route.http_method => route }
  rest_api_id  = aws_api_gateway_rest_api.example.id
  resource_id  = aws_api_gateway_resource.api.id
  http_method  = each.value.http_method
  authorization = each.value.authorization
}

resource "aws_api_gateway_integration" "api_integration" {
  for_each        = { for route in var.routes : route.http_method => route }
  rest_api_id     = aws_api_gateway_rest_api.example.id
  resource_id     = aws_api_gateway_resource.api.id
  http_method     = each.value.http_method
  type            = "HTTP_PROXY"
  uri             = each.value.target_url
  integration_http_method = each.value.http_method
}
