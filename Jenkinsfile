pipeline {
    agent { docker { image 'mcr.microsoft.com/azuredocs/azure-vote-front:v1' } }

    stages {
        stage('Build') {
            steps {
              sh ''
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}


