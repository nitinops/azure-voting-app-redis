pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitinops/azure-voting-app-redis']]])
            }
        }
        
        stage("build image") 
        {
            steps {
                script {
                    bat """
                    docker --version
                    docker build -t "pythonapp:v1" ".//azure-vote"
                    """
                    }
                }
        }
        
       agent {
    kubernetes {
        label podlabel
        yaml """
kind: Pod
metadata:
  name: jenkins-agent
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    imagePullPolicy: Always
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
      - name: azure-secret
        mountPath: /root/.aws/
      - name: docker-registry-config
        mountPath: /kaniko/.docker
  restartPolicy: Never
  volumes:
    - name: azure-secret
      secret:
        secretName: azure-secret
    - name: docker-registry-config
      configMap:
        name: docker-registry-config
"""
   }
       }
