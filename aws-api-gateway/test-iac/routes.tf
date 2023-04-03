module "api_gateway" {
  source = "../main"

  routes = [
    {
      path          = "/users"
      http_method   = "POST"
      authorization = "AWS_IAM"
      target_url    = "https://myapi.com/users"
    },
    {
      path          = "/items"
      http_method   = "GET"
      authorization = "NONE"
      target_url    = "https://myapi.com/items"
    },
    {
      path          = "/orders"
      http_method   = "PUT"
      authorization = "AWS_IAM"
      target_url    = "https://myapi.com/orders"
    },
    # Em caso de chamadas do tipo MOCK
    {
      path          = "/uo/lo/lolli/poop"
      http_method   = "GET"
      authorization = "NONE"
      target_url    = null
      is_mock       = true
      mock_response = <<MOCK_RESPONSE
        {
          "status": "200",
          "headers": {
            "Content-Type": "application/json"
          },
          "body": {
            "message": "This is a mock response"
          }
        }
      MOCK_RESPONSE
    }
  ]
}
