pipeline {
    agent any
    parameters {
    string(name: 'STATEMENT', defaultValue: 'hello; ls /', description: 'What should I say?')
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
           
        
         def stdout = bat(returnStdout: true, script: './/first_basic_batch.bat')
            println("${string}")
            }
        }
        }
    }
}
}
      
