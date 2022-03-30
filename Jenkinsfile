pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                def SetValue = bat(returnStdout: true, script: CALL :SetValue './/first_basic_batch.bat')
                echo "${SetValue}"
                                 
            }
        }
            
            }
        }
        }
