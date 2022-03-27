pipeline {
    agent any
def imagename="nitin7982/pythonapp"
def tagname="v1"
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
                    docker build -t "${imagename}:${tagname}" ".//azure-vote"
                    """
                    }
                }
        }
        
      stage ("upload ECR") {
            steps {
                script {
                    bat """
                    docker push "${imagename}:${tagname}"
                    """
                }
            }
        }
        
        stage ("Deploy to K8S") {
            steps {
                powershell """
                (Get-Content ".\\azure-vote\\azure-vote-all-in-one-redis.yaml").replace('@img@', "${imagename}:${tagname}") | Set-Content ".\\azure-vote\\azure-vote-all-in-one-redis.yaml"
                """
            }
        }
    }    
}
