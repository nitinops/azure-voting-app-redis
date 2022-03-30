pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                def SetValue = bat(returnStdout: true, script: ('.//first_basic_batch.bat')
                echo "${SetValue}"
                                 
            }
        }
            
            }
        }
        }
