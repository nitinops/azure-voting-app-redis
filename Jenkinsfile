pipeline {
    agent any
    stages{
         stage('Develop Branch Deploy Code') {
         steps {
         build(job: 'pipeline.First-Multibranch-Pipeline', parameters: [string(name: 'DEPLOY_TO', value: "test")])
    }
}
}
}
