instance_type = "t2.large"
# override vpc cidrs
vpc_config = {
  name = "qa"
  cidr = "10.0.1.0/24"
  subnets = {
    public  = "10.0.1.0/25"
    private = "10.0.1.128/25"
  }
}
