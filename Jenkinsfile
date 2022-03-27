pipeline {
    agent any

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
                    bat """
                    docker --version
                    docker build -t "pythonapp:v1" ".//azure-vote"
                    """
                    }
                }
        }
        
      stage ("upload ECR") {
            steps {
                script {
                    bat """
                    docker push "nitin7982/pythonapp:v1"
                    """
                }
            }
        }
        
        stage ("Deploy to K8S") {
            steps {
                bat """
                kubectl get nodes
                """
                }
            }
        }
    }    
}
