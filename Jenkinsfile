pipeline {
    agent any

    stages {
        stage('Clone from parrot') {
            steps {
                git branch: 'main', url: 'https://github.com/VegetaCK/Jens.git'
            }
        }

        stage('Run Python script') {
            steps {
                echo 'Запускаем parrot.py...'
                sh 'python3 parrot.py'
            }
        }
    }
}
