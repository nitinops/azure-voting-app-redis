pipeline {
    agent any
    environment
    {
    value1="Ankit"
    value2="NITIN"
    }
    stages {
        stage('Checkout'){
        steps {
            script{
                
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
               def stdout = bat(returnStdout: true, script: """.//first_basic_batch.bat ${env.value1}""")
                echo "${stdout}" 
            
        
            

                
            }
       }
        }
            
            }
}
                
       

                                         
         
      
