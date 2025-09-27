pipeline {
    agent none

    tools {
        nodejs "NodeJS"
    }

    stages {
        stage('Docker Agent Build') {
            agent { label 'docker-agent' }
            steps {
                checkout scm
                sh 'docker build -t node-app .'
                sh 'docker run -d -p 3000:3000 node-app'
            }
        }

        stage('EC2 Agent Build') {
            agent { label 'ec2-agent' }
            steps {
                checkout scm
                sh 'npm install'
                sh 'npm test'
            }
        }
    }

    post {
        always {
            slackSend(channel: '#jenkins-notifications', message: "Pipeline finished on branch ${env.BRANCH_NAME}")
        }
    }
}
