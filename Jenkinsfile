def getCommandOutput(bat) {
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
                    if (isUnix()){
         return sh(returnStdout:true , script: '#!/bin/sh -e\n' + bat).trim()
     } else{
       stdout = bat(returnStdout:true , script: bat).trim()
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
