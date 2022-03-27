//def artifactoryName="https://hub.docker.com/repository/docker/"
def imagename="nitin7982/pythonapp"
def tagname="v1"
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
                    docker build -t "${imagename}:${tagname}" ".//azure-vote"
                    """
                    }
                }
        }
        
      stage ("upload ECR") {
            steps {
                script {
                    bat """
                    docker login -u "nitin7982" -p "a2576a29-e7c0-4d5a-90db-dc55209ba8cc"
                    docker push "${imagename}:${tagname}"
                    """
                }
            }
        }
        
        stage ("Deploy to K8S") {
            steps {
                powershell """
                (Get-Content "${WORKSPACE}\\azure-vote-all-in-one-redis.yaml").replace('@img@', "${imagename}:${tagname}") | Set-Content "${WORKSPACE}\\azure-vote-all-in-one-redis.yaml"
                """
            }
        }
    }    
