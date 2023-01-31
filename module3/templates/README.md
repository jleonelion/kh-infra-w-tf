# Templates and Templating

Review these materials that talk about specific aspects of templating:

- [heredoc](https://developer.hashicorp.com/terraform/language/expressions/strings#heredoc-strings)
- [interpolation](https://developer.hashicorp.com/terraform/language/expressions/strings#interpolation)
- [directives](https://developer.hashicorp.com/terraform/language/expressions/strings#directives)
- [tempatefiile](https://developer.hashicorp.com/terraform/language/functions/templatefile)

## Excercise

- Modify user_data attribute in [resource.compute.tf](./start/resource.compute.tf); change from defining script inline Terraform code to loading from a template file
- Template file will be small shell script (much like current hereto)
- Shell script must:
  - Update apt packages
  - Install nginx package
- Create html page in /var/www/html/index.html
- Web page must display name of the server (as assigned in the Name tag)
- If server is the first server, web page must communicate it is the first server of the group
- If server is not the first server, web page must convey discontent

Simple HTML page to help you get started:

```html
<!DOCTYPE html>
<html>
<body>

<h1>Hello, this is (need to know my name)</h1>

<p>
I am not sure if I am the first or not?  Would be nice to have a directive and figure this out in Terraform
</p>

</body>
</html>
```