module "web_app" {
  source = "./modules/web_app"

  name_prefix = "example"

  instance_type  = "t2.micro"
  instance_count = 2

  vpc_id        = "vpc-0a877fb493052e5d3"
  public_subnet = false

  alb_listener_arn = "arn:aws:elasticloadbalancing:ap-southeast-1:255945442255:listener/app/shared-alb/e49602e964c05d9f/7ef088c24de0d89d"
}
