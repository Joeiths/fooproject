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
        stage('Test') {
             steps {
                sh "mvn test"
             }
        }
        stage('Create coverage report') {
                     steps {
                        sh "mvn cobertura:cobertura"
                     }
                }
        stage('Newman') {
            steps {
                sh 'newman run "Restful Booker.postman_collection.json" --environment "Restful Booker.postman_environment.json" --reporters cli,junit'
            }
            post {
                    always {
                            junit '**/*xml'
                    }
             }
       
