pipeline{
    agent {
        label 'build.machine'
    }

    environment {
        GIT_URL = 'git@github.com:rafaftahsin/Unity-Jenkinsfile-Exmaple.git'
    }

    
    stages{
        stage('Try Catch Block'){
            steps {
                script {
                    try {
                        bat """
                        dir
                        """
                    }
                    catch (exc) {
                        bat 'first_basic_batch'
                        error("Build Failed Due to Test Fail.")
                    }
                }
            }
        }
    }
}
