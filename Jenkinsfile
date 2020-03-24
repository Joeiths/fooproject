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
        stage('Newman') {
            steps {
                sh 'newman run Restful_Booker_postman_collection.json --environment Restful_Booker_postman_environment.json --reporters junit'
            }
            post {
                always {
                    junit '**/*xml'
                }
            }
        }
        stage('Robot Framework System tests with Selenium') {
            steps {
                sh 'robot -d results --variable BROWSER:headlesschrome RentCar.robot  Tests'
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class              : 'RobotPublisher',
                                outputPath          : 'results',
                                outputFileName      : '**/output.xml',
                                reportFileName      : '**/report.html',
                                logFileName         : '**/log.html',
                                disableArchiveOutput: false,
                                passThreshold       : 50,
                                unstableThreshold   : 40,
                                otherFiles          : "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
        }
    }
}