# [Insert credentials in AWS CLI into terraform variables]

- terraform init
- terraform apply

# [Change inventory with the ip of EC2, and inserted private key into ./secrets/ssh.private]

- ansible-playbook -i inventory.yaml application.yaml
