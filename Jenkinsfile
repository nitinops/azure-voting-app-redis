//def artifactoryName="https://hub.docker.com/repository/docker/"
def imagename="nitin7982/pythonapp"
def tagname="v1"
pipeline {
    agent any
node('windows') {

    stage('Checkout'){
        git('https://github.com/nitinops/azure-voting-app-redis.git')
        stdout = bat(returnStdout: true, script: 'git rev-parse HEAD')
        println("stdout ################ " + stdout + " ####################")
   }

}

     
