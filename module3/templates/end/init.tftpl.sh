#!/bin/bash
sudo apt update -y && sudo apt install -y nginx
cat > /var/www/html/index.html<< EOF
<!DOCTYPE html>
<html>
<body>

<h1>Hello, this is ${name}</h1>

<p>
%{ if index == 1 ~}
I am the first one :)
%{ else ~}
I am just another clone :(
%{ endif ~}
</p>

</body>
</html>
EOF