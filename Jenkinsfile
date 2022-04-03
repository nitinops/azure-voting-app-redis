pipeline {
    agent any
    stages{
         stage('Start') {
         steps {
         build(job: 'pipeline.pipeline1', parameters: [string(name: 'DEPLOY_TO', value: "test")])
    }
}
}
}
