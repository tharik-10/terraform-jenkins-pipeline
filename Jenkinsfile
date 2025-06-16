pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        TF_VAR_aws_access_key = AWS_ACCESS_KEY_ID
        TF_VAR_aws_secret_key = AWS_SECRET_ACCESS_KEY
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-username/terraform-cicd.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Approval') {
            steps {
                input message: 'Approve to apply the infrastructure?'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }

        stage('Output Instance Info') {
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
