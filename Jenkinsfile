pipeline{
    agent any {
  
    environment {
        GIT_URL = 'https://github.com/nitinops/azure-voting-app-redis.git'
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
