pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
             bat """
        
        set stdout = bat(returnStdout: true, script: 'git rev-parse HEAD')
        echo("stdout ################ " + stdout + " ####################")
        """
        }
        }
    }
}
      
