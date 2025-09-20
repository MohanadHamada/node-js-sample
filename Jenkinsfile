pipeline {
    agent any

    tools {
        nodejs "NodeJS"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/username/node-js-sample.git',
                    credentialsId: 'github-username',
                    branch: 'main'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build || echo "No build script found"'
            }
        }
    }
}
