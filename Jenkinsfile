pipeline {
  agent { label 'agent-1' }

  environment {
    TF_VAR_region = 'us-east-1'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'terraform', url: 'https://github.com/flipkart-project-march/Terraform-Ansible-AWS.git'
      }
    }

    stage('Terraform Init/Plan/Apply') {
      steps {
        withCredentials([
          string(credentialsId: 'aws_access_key_id', variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'aws_secret_access_key', variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh '''
            export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
            export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
            
            terraform init
            terraform plan -out=tfplan

            # Uncomment below to apply changes automatically
              terraform destroy -auto-approve
          '''
        }
      }
    }
  }
}
