pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Joeiths/fooproject.git'
            }
        }
        stage('Newman') {
            steps {
                sh 'newman run "Restful_Booker_postman_collection.json" --environment "Restful_Booker_postman_environment.json" --reporters cli,junit'
            }
            post {
                    always {
                            junit '**/*xml'
                    }
             }
        }
    } 
}
