pipeline {
    agent any

    stages {
        stage('Checkout Git') {
            steps {
                echo 'Pulling from git ...';
                git branch: 'main',
                    url: "https://github.com/khalilDimassi/achat-front";
            }
        }

        stage('Install Dependencies') {
          steps {
            sh 'npm install'
          }
        }

        stage('Build') {
          steps {
            sh 'ng build'
          }
        }
        
        stage('Run Unit Tests') {
          steps {
            sh 'ng test'
          }
        }
        
        stage('Run E2E Tests') {
          steps {
            sh 'ng e2e'
          }
        }

        stage('DOCKER: BUILD') {
            steps{
                sh 'docker build -t khaliladimassi/achat_front:1.0 .'
            }
        }
        
        stage('DOCKER: LOGIN & PUSH') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'
                }
                
                sh 'docker push khaliladimassi/achat_front:1.0'
                echo 'IMAGE DEPLOYED SUCCESSFULLY!'
            }
        }
    }    
}
