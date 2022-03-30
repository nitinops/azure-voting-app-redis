pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
             bat """
        
        set stdout = bat(returnStdout: true, script: './/first_basic_batch.bat')
        echo("stdout ################ " + stdout + " ####################")
        """
        }
        }
    }
}
      
