pipeline {
    agent any
    parameters {
        string(name: 'Greeting', defaultValue: 'Hello', description: 'How should I greet the world?')
    }
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
           
        
         def stdout = bat(returnStdout: true, script: './/first_basic_batch.bat')
            echo "${string}"
            }
        }
        }
    }
}


      
