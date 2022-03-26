pipeline {
    agent any

    environment {
       
    }
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitinops/azure-voting-app-redis.git']]])
            }
        }
        
        stage ("build image") 
        {
            steps {
                script {
                    dockerImage = docker.build registry
                    }
                }
        }
        
        stage ("upload ECR") {
            steps {
                script {
                   
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

