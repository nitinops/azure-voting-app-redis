pipeline {
   agent any
   tools {
       maven 'C:\Users\nitinrpa\Downloads\apache-maven-3.8.5-src\apache-maven-3.8.5'
       jdk 'C:\Users\nitinrpa\Downloads\jdk-17_windows-x64_bin\jdk-17.0.2'
   }
   stages {
       stage("Tools initialization") {
           steps {
               sh "mvn --version"
               sh "java -version"
           }
       }
       stage("Checkout Code") {
           steps {
               checkout scm
           }
       }
       stage("Check Code Health") {
           when {
               not {
                   anyOf {
                       branch 'master';
                       branch 'develop'
                   }
               }
          }
          steps {
              sh "mvn clean compile"
           }
       }
       stage("Run Test cases in LambdaTest") {
           when {
               branch 'develop';
           }
           environment {
               LAMBDATEST_CRED = credentials('Lambda-Test-Credentials-For-multibranch')
               LT_USERNAME = "$nitinops"
               LT_ACCESS_KEY = "$Global#12345"
           }
          steps {
              sh "mvn test"
           }
       }
   }
}
