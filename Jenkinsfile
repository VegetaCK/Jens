pipeline {
    agent any

    parameters {
        string(name: 'PHRASE', defaultValue: 'Привет, попугай!', description: 'Фраза для попугая')
    }

    environment {
        IMAGE_NAME = 'parrot-image'
        DOCKER_REGISTRY = 'your-docker-registry' // Укажи свой Docker Registry, если используешь приватный реестр
    }

    stages {
        stage('Clone from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/VegetaCK/Jens.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Собираем Docker-образ
                    sh "docker build -t ${env.IMAGE_NAME} ."
                }
            }
        }

        stage('Run Python script in Docker') {
            steps {
                script {
                    // Запускаем контейнер с образом, передавая параметр PHRASE
                    sh "docker run --rm ${env.IMAGE_NAME} ${params.PHRASE}"
                }
            }
        }

        stage('Push Docker Image') {
            when {
                branch 'main'
            }
            steps {
                script {
                    // Пушим образ в Docker-реестр
                    sh "docker tag ${env.IMAGE_NAME} ${env.DOCKER_REGISTRY}/${env.IMAGE_NAME}:latest"
                    sh "docker push ${env.DOCKER_REGISTRY}/${env.IMAGE_NAME}:latest"
                }
            }
        }
    }
}
