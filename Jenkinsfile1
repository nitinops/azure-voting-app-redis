pipeline {
    agent
    {
        node {
                label 'master'
                customWorkspace "${env.JobPath}"
              }
    }

    stages 
    {
        stage('Start') {
            steps {
                sh 'ls'
            }
        }

        stage ('Invoke_pipeline') {
            steps {
                build job: 'pipeline1', parameters: [
                string(name: 'param1', value: "value1")
                ]
            }
        }

        stage('End') {
            steps {
                sh 'ls'
            }
        }
    }
}
