pipeline {
    agent any
    parameters {
        choice(
            name: 'Action',
            choices: "apply\ndestroy",
            description: 'Apply or Destroy Instance'
        )
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    if (params.Action == "apply"){
                        git branch: 'main',credentialsId: 'my-keys', url: 'git@github.com:USERNAME/automation.git'

                        dir ('staycationX'){
                            git branch: 'nginx', credentialsId: 'my-keys', url: 'git@github.com:USERNAME/staycationX.git'
                        }
                    }
                }
            }
        }

        stage('Docker') {
            steps {
                script {
                    if (params.Action == "apply") {
                        sh 'ansible-playbook -i ansible/inventory ansible/build-docker.yaml'
                    }
                }
            }
        }

        stage('Terraform') {
            steps {
                script {
                    if (params.Action == "apply") {
                        sh 'terraform -chdir=terraform init'
                        sh 'terraform -chdir=terraform apply -var="name=prod-ict381" -var="group=web" --auto-approve'
                    }
                    else {
                        sh 'terraform -chdir=terraform destroy -var="name=prod-ict381" -var="group=web" --auto-approve'
                    }
                }
            }
        }

        stage('Ansible') {
            steps {
                script {
                    if (params.Action == "apply") {
                        sh 'ansible-playbook -i /etc/ansible/aws_ec2.yaml ansible/prod-application.yaml'
                    }
                }
            }
        }
    }
}