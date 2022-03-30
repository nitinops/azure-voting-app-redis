:SetValue
set "%~1 = 5"
set "%~2 = 10"
EXIT /B 0
pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                SetValue = call(CALL :SetValue value1,value2 , script: './/first_basic_batch.bat')
                echo "${SetValue}"
                
         

    }
}
            }
        }
        }
  

                
           
             

        
         


      
