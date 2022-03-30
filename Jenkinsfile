pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                stdout = call(returnStdout: true, script: './/first_basic_batch.bat')
                echo "${stdout}"
                result = stdout.readLines().drop(1).join(" ")       
       return result
                
         

    }
}
            }
        }
        }
  

                
           
             

        
         


      
