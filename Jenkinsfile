pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials') // Здесь должно быть имя ваших Jenkins credentials
    }

    stages {
        stage('Checkout from Git') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Собираем Docker образ
                    sh 'docker build -t vegetack/parrot-image .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Логинимся в Docker Hub с помощью credentials
                    sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u vegetack --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Отправляем образ на Docker Hub
                    sh 'docker push vegetack/parrot-image'
                }
            }
        }
    }

    post {
        always {
            // Опционально: очищаем образ после завершения сборки
            sh 'docker rmi vegetack/parrot-image || true'
        }
    }
}
