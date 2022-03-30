pipeline {
    agent any
node('windows') {

    stage('Checkout'){
        git('https://github.com/nitinops/azure-voting-app-redis.git')
        stdout = bat(returnStdout: true, script: 'git rev-parse HEAD')
        println("stdout ################ " + stdout + " ####################")
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
