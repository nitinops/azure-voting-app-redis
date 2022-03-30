pipeline {
    agent any
    environment
    {
    value1=1
    value2=2
    }
    stages {
        stage('Checkout'){
        steps {
            script{
                
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
               def stdout = bat(returnStdout: true, script: """.//first_basic_batch.bat "${env.BRANCH_NAME}""")
                echo "${stdout}" 
            
        
            

                
            }
       }
        }
            
            }
}
                
       

                                         
         
      
