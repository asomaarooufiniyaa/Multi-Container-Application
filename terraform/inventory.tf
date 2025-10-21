resource "local_file" "ansible_inventory" {
  content = <<EOF
[web_servers]
${aws_instance.web_server.public_ip} ansible_user=ubuntu
EOF

  filename = "../ansible/inventories/hosts.ini"
}
