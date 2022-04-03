pipeline {
    agent any
    stages{
         stage('Invoke_pipeline') {
         steps {
         build(job: 'Pipeline.pipeline', parameters: [string(name: 'DEPLOY_TO', value: "test")])
    }
}
}
}
