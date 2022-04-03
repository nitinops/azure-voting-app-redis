pipeline {
    agent any
    stages{
         stage('Invoke_pipeline') {
         steps {
         build(job: 'pipeline.pipeline', parameters: [string(name: 'DEPLOY_TO', value: "test")])
    }
}
}
}
