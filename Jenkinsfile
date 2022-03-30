pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
             bat """
        git('https://github.com/nitinops/azure-voting-app-redis.git')
        stdout = bat(returnStdout: true, script: 'git rev-parse HEAD')
        """
        }
        }
    }
    stage('Build') {
            steps {
   echo
   "C:\Users\nitinrpa\azure-voting-app-redis\azure-vote" /b *.txt
 
                
              
            }
        }




       

    

