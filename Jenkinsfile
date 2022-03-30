pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                def stdout = bat(returnStdout: true, script: './/first_basic_batch.bat').trim()
                result = stdout.readLines().drop(1).join(" ")       
       return result
                                 
            }
        }
            
            }
        }
        }
