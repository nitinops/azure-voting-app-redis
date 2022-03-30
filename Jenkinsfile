pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
           
        
        set stdout = bat(returnStdout: true, script: './/first_basic_batch.bat')
            println("${stdout}")
        
        }
        }
    }
}
      
