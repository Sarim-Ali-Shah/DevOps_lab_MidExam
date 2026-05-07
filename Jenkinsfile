pipeline {
    agent any
    
    stages {
        stage('FETCH') {
            steps {
                echo 'Fetching latest code from GitHub...'
                git branch: 'main', url: 'https://github.com/Sarim-Ali-Shah/DevOps_lab_MidExam.git'
            }
        }
        
        stage('TRAIN') {
            steps {
                echo 'Building Docker image and training model...'
                sh 'sudo docker build -t ml-pipeline .'
            }
        }
        
        stage('SERVE') {
            steps {
                echo 'Stopping old container and starting new one...'
                sh 'sudo docker stop ml-app || true'
                sh 'sudo docker rm ml-app || true'
                sh 'sudo docker run -d -p 8000:8000 --name ml-app ml-pipeline'
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished!'
        }
    }
}
