#!/usr/bin/env groovy

pipeline {
  agent {
    kubernetes {
      label 'kubernetes-master-1'
    }
  }

  stages {
    #stage('Clone repository') {
     # steps {
      #  git 'https://github.com/your-repo.git'
      #}
    #}

    stage('Build docker images') {
      steps {
        sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-web -t app-1:web /'
		    sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-database -t app-1:database /'
		    sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-phpmyadmin -t app-1:phpmyadmin /'
      }
    }

    stage('Deploy on Kubernetes') {
      steps {
          sh 'kubectl apply -f /home/ranul/workspace/Node-App/deployment.yaml'
      }
    }
  }
}
