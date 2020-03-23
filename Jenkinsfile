pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Joeiths/fooproject.git'
            }
        }
        stage('Build') {
            steps {
                sh "mvn compile"
            }
        }
       
        }
    }
 
