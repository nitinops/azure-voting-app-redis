pipeline {
    agent none
    stages {
        stage('Build') {
            agent any
            steps {
                checkout scm
                bat 'make'
                stash includes: '**/first_basic_batch/*.bat', name: 'app' 
            }
        }
        stage('Test on Linux') {
            agent { 
                label 'linux'
            }
            steps {
                unstash 'app' 
                bat 'make check'
            }
            post {
                always {
                    junit '**/first_basic_batch/*.bat'
                }
            }
        }
        stage('Test on Windows') {
            agent {
                label 'windows'
            }
            steps {
                unstash 'app'
                bat 'make check' 
            }
            post {
                always {
                    junit '**/first_basic_batch/*.bat'
                }
            }
        }
    }
}
