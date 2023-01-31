# Meta-Arguments

Read more about meta-arguments:

- [depends_on](https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on)
- [count](https://developer.hashicorp.com/terraform/language/meta-arguments/count)
- [for_each](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
- [provider](https://developer.hashicorp.com/terraform/language/meta-arguments/resource-provider)
- [lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

## Excercise Instructions

Modify the [starting copy](./start/) of the "Simple AWS IaaS Solution" so the number of web servers behind the load balancer can be defined in an input variable:

- `num_web_servers` is the name of the variable controlling the number of web servers to put behind the ALB
- default value for `num_web_servers` is 2, min value is 2, max value is 10
- use appropriate meta-arguments to create the `aws_instance` and `aws_alb_target_group_attachment` resources
- EC2 instances should be evenly distributed between the two subnets
