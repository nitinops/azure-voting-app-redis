pipeline {
    agent any
    parameters {
        string(name: 'PARAM1', description: 'Param 1?')
        string(name: 'PARAM2', description: 'Param 2?')
    }
    stages {
        stage('Example') {
            steps {
                echo "${params}"
                script {
                    def myparams = params + string(name: 'MYPARAM', value: "${params.MYPARAM}")
                    build job: 'downstream-pipeline-with-params', parameters: myparams
                }    
            }
        }
    }

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
