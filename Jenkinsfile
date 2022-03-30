pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
                bat """
           %cd%\\Users\\nitinrpa\\azure-voting-app-redis "${env.first_basic_batch.bat}"}
           
           """
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
               def stdout = bat(returnStdout: true, script: './/first_basic_batch.bat')
                echo "${result}" 
                                         
            }
        }
            
            }
        }

}
