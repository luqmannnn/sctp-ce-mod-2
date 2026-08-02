variable "name" {
   type = string
   description = "name of app"
   # default = "luqman"
}

variable "instance_type" {
   type = string
   description = "EC2 instance type"
   default = "t3.micro"
}