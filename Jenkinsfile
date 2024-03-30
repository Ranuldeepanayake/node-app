#!/usr/bin/env groovy

pipeline {

    agent {
        docker {
            args '-u root'
        }
    }
	
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f ~/docker/dockerfile-app-1-web -t app-1:web .'
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 3000:3000 --name app-1-web'
            }
        }
    }
}