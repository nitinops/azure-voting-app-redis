pipeline{
    agent {
        label 'build.machine'
    }

    environment {
        GIT_URL = 'git@github.com:rafaftahsin/Unity-Jenkinsfile-Exmaple.git'
    }

    
    stages{
        stage('Git Clone'){
            steps {
                deleteDir()
                slackSend channel: '#hal-alerts', message: "${env.JOB_NAME} is started"
                git branch: 'development', credentialsId: 'Jenkins Master SSH', url: "${GIT_URL}"
            }
        }
    }

    post { 
        always { 
            script{
                slackSend channel: '#channel-name', message: "${env.JOB_NAME}"
            }
        }

        changed { 
            script{
                slackSend channel: '#channel-name', message: "${env.JOB_NAME} is CHANGED. See ${env.BUILD_URL} console for details."
            }
        }
        
        failure { 
            script{
                slackSend channel: '#channel-name', message: "${env.JOB_NAME} is FAILED. See ${env.BUILD_URL} console for details."
            }
        }
        
        success { 
            script{
                slackSend channel: '#channel-name', message: "${env.JOB_NAME} is SUCCESS. See ${env.BUILD_URL} console for details."
            }
        }
        
        unstable { 
            script{
                slackSend channel: '#channel-name', message: "${env.JOB_NAME} is UNSTABLE. See ${env.BUILD_URL} console for details."
            }
        }
        
        aborted { 
            script{
                slackSend channel: '#channel-name', message: "${env.JOB_NAME} is ABORTED. See ${env.BUILD_URL} console for details."
            }
        }
    }
}
