pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['apply', 'destroy'],
            description: 'Select whether to apply or destroy the infrastructure'
        )
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        TF_VAR_aws_access_key = "${AWS_ACCESS_KEY_ID}"
        TF_VAR_aws_secret_key = "${AWS_SECRET_ACCESS_KEY}"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/tharik-10/terraform-jenkins-pipeline.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Approval Before Apply/Destroy') {
            steps {
                script {
                    if (params.ACTION == 'apply') {
                        input message: 'Approve to APPLY the infrastructure?'
                    } else if (params.ACTION == 'destroy') {
                        input message: 'Approve to DESTROY the infrastructure?'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform apply tfplan'
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }

        stage('Output Instance Info') {
            when {
                expression { params.ACTION == 'apply' }
            }
            steps {
                sh 'terraform output'
            }
        }
    }

    post {
        failure {
            echo "❌ Pipeline failed"
        }
        success {
            echo "✅ Pipeline completed"
        }
    }
}
