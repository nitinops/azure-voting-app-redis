pipeline {
    agent any
    stages {
        stage('Master Branch Deploy Code') {
            when {
                branch 'master'
            }
            steps {
                bat """
                echo "Building Artifact from Master branch"
                """

                bat """
                echo "Deploying Code from Master branch"
                """
            }
        }
        stage('Develop Branch Deploy Code') {
            when {
                branch 'develop'
            }
            steps {
                bat """
                echo "Building Artifact from Develop branch"
                """
                bat """
                echo "Deploying Code from Develop branch"
                """
           }
        }
        stage('Prod Branch Deploy Code') {
            when {
                branch 'prod'
            }
            steps {
                bat """
                echo "Building Artifact from prod branch"
                """
                bat """
                echo "Deploying Code from prod branch"
                """
            }
        }
    }
}
