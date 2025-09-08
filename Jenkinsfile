pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/WinsonMARS/P2.git'
            }
        }

        stage('Build') {
            steps {
                bat 'gradlew build'
            }
        }

        stage('Test') {
            steps {
                bat 'gradlew test'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t hello-world-java:v1 ."
                }
            }
        }

        stage('Deploy with Docker') {
            steps {
                script {
                    bat '''
                    docker stop hello-world-java || true
                    docker rm hello-world-java || true
                    docker run -d --name hello-world-java -p 9090:9090 hello-world-java:v1
                    '''
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace'
            deleteDir() 
        }
        success {
            echo 'Build succeeded!!!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
