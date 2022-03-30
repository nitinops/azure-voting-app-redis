pipeline {
    agent any
    stages {
        node('windows') {

    stage('Checkout'){
        git('https://github.com/nitinops/azure-voting-app-redis.git')
        stdout = bat(returnStdout: true, script: 'git rev-parse HEAD')
        println("stdout ################ " + stdout + " ####################")
   }

}
}
}

