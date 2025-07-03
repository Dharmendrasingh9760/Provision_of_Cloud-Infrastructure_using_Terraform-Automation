#!/bin/bash
#cloud-config

# Update and install Apache
apt update -y
apt install apache2 -y

# Enable and start Apache
systemctl start apache2
systemctl enable apache2

# Get the EC2 instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Create a clean HTML page with just colored highlights
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
</head>
<body>
  <h1 style="color: green;">Apache Server Deployed Successfully!</h1>
  <p>HELLO FROM TERRAFORM</p>
  <p>Welcome to webserver 2</p>
  <p><strong style="color: blue;">Instance ID:</strong> <span style="color: red;">$INSTANCE_ID</span></p>
</body>
</html>
EOF
