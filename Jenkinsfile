//def artifactoryName="https://hub.docker.com/repository/docker/"
def imagename="nitin7982/pythonapp"
def tagname="v1"
pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitinops/azure-voting-app-redis.git']]])
            }
        }

    stages {
        stage('Build') {
            steps {
                script {
                    bat """
                        def getCommandOutput(cmd) {
    if (isUnix()){
         return sh(returnStdout:true , script: '#!/bin/sh -e\n' + cmd).trim()
     } else{
       stdout = bat(returnStdout:true , script: cmd).trim()
       result = stdout.readLines().drop(1).join(" ")       
       return result
       """
          
    } 
}
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
