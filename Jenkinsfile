#!/usr/bin/env groovy

pipeline {
  agent { 
	  label 'kubernetes-master-1'
  }
	
  stages {
    //stage('Build docker images') {
      //steps {
	//sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-nodejs-base -t localhost:5000/base-nodejs:v1 /'
	//sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-database-base -t localhost:5000/base-mysql:v1 /'
	//sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-phpmyadmin-base -t localhost:5000/base-phpmyadmin:v1 /'

	//sh 'docker push localhost:5000/base-nodejs:v1'
	//sh 'docker push localhost:5000/base-mysql:v1'
	//sh 'docker push localhost:5000/base-phpmyadmin:v1'
	      
        //sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-web -t localhost:5000/app-1:web /'
	//sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-database -t localhost:5000/app-1:database /'
	//sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-phpmyadmin -t localhost:5000/app-1:phpmyadmin /'

	//sh 'docker push localhost:5000/app-1:web'
	//sh 'docker push localhost:5000/app-1:database'
	//sh 'docker push localhost:5000/app-1:phpmyadmin'
      //}
    //}

    stage('Deploy on Kubernetes') {
      steps {
          sh 'kubectl apply -f /home/ranul/workspace/Node-App/deployment.yml'
      }
    }
  }
}
