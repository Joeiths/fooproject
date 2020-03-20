pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Joeiths/fooproject.git'
            }
        }
        stage('newman') {
            steps {
                sh 'newman run Restful_Booker_postman_collection.json --environment Restful_Booker_postman_environment.json --reporters junit'
            }
            post {
                    always {
                            junit '**/*xml'
                    }
             }
        }
    } 
}
