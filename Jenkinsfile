pipeline {
    agent any

    environment {
        registry = "account_id.dkr.ecr.us-east-2.amazonaws.com/my-docker-repo"
    }
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitinops/azure-voting-app-redis']]])
            }
        }
        
        stage("build image") 
        {
            steps {
                script {
                    docker --version
                    docker build -t "pythonapp:v1" ".//azure-vote"
                    }
                }
        }
        
        stage("upload ECR") {
            steps {
                script {
                    sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin account_id.dkr.ecr.us-east-2.amazonaws.com"
                    sh "docker push account_id.dkr.ecr.us-east-2.amazonaws.com/my-docker-repo:latest"
                }
            }
        }
        
        stage ("Deploy to K8S") {
            steps {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'K8S', namespace: '', serverUrl: '') {
                      sh 'kubectl apply -f eks-deploy-from-ecr.yaml'
                }
            }
        }
    }    
}
