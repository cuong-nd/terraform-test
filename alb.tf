# module "alb" {
#   source  = "terraform-aws-modules/alb/aws"
#   version = "~> 5.0"

#   name = "my-alb"

#   load_balancer_type = "application"

#   vpc_id      =     "module.vpc.vpc_id"
#   subnets            = ["tolist(module.vpc.public_subnets)[0]", "tolist(module.vpc.public_subnets)[1]"]
#   security_groups    = ["module.alb_sg.this_security_group_id"]

#   access_logs = {
#     bucket = "my-alb-logs"
#   }

#   target_groups = [
#     {
#       name_prefix      = "default"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#     }
#   ]

# #   https_listeners = [
# #     {
# #       port               = 443
# #       protocol           = "HTTPS"
# #       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
# #       target_group_index = 0
# #     }
# #  ]

#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     }
#   ]

#   tags = {
#     Environment = "Test"
#   }
# }
