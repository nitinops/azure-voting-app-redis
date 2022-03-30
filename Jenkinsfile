pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                bat "%cd%\\"C:\Users\nitinrpa\azure-voting-app-redis\azure-vote" ${env.nitinops/azure-voting-app-redis/first_basic_batch}"
                result = stdout.readLines()
                echo "${result}" 
                                            
            }
        }
            
            }
        }
    
