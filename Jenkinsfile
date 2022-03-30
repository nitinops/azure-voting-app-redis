pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitinops/azure-voting-app-redis.git']]])
            }
        }

    stages {
        stage('Build') {
            steps {
                script {
                    bat """
                    
                    docker --version
                    docker build -t "${imagename}:${tagname}" ".//azure-vote"
                    return result
                    """
                     
                                    }
                      
    } 
}
                    
            
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
