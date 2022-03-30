pipeline {
    agent any
    
    }
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                @echo off
SETLOCAL
CALL :SetValue value1,value2
echo %value1%
echo %value2%
EXIT /B %ERRORLEVEL%
:SetValue
set "%~1 = 5"
set "%~2 = 10"
EXIT /B 0
           
             

        
         def stdout = bat(returnStdout: true, script: './/first_basic_batch.bat')
            echo "${params.Greeting} How should I greet the world?"
            }
        }
        }
    }
}


      
