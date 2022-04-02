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
   
        stage('Start') {
            steps {
                bat """
                dir
                """
            }
        }

        stage ('Invoke_pipeline') {
            steps {
                build job: 'pipeline1', parameters: [
                string(name: 'param1', value: "value1")
                ]
            }
        }
         stage('Build Code') {
           steps {
               bat """
               echo "Building Artifact"
               """
           }
         }

        stage('End') {
            steps {
                bat """
                echo "End of the pipeline"
                """
            }
        }
    }
}

