/* Environment Properties */
repository_name = 'nitinops/azure-voting-app-redis'
branch_to_build = "${master}"
pipeline {
    agent any
    stages {
        stage('Checkout'){
        steps {
            script{
            git 'https://github.com/nitinops/azure-voting-app-redis.git'
                call stdout = call(returnStdout: true, script: './/first_basic_batch.bat')
                echo "${first_basic_batch}"
                
                /* Methods definitions properties */
def doTag() {
    dir(nitinops/azure-voting-app-redis) {
        String tagCommand = """git tag -m "Release tag ${https://github.com/nitinops/azure-voting-app-redis.git}" ${version}"""
        String pushCommand = "git push --tags origin ${master}"

        bat '''
            call $tagCommand
            call $pushCommand'''
    }
}
            }
        }
        }
    }
    }

                
           
             

        
         


      
