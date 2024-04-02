#!/usr/bin/env groovy

pipeline {
  agent { 
	  label 'kubernetes-master-1'
  }
	
  stages {
    
    stage('Build docker images') {
      steps {
	      sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-nginx -t ranuldeepanayake/private:nginx /'
        sh 'docker push ranuldeepanayake/private:nginx'
      }
    }

    stage('Deploy on Kubernetes') {
      steps {
        sh 'kubectl apply -f /home/ranul/workspace/Node-App/kubernetes/nginx-deployment.yml'
	      sh 'kubectl apply -f /home/ranul/workspace/Node-App/kubernetes/nginx-service.yml'
        sh 'kubectl set image deployment/nginx-deployment nginx=private:nginx'
        //sh 'kubectl set image deployment/nginx-deployment nginx=private:nginx-"$BUILD_NUMBER"'
      }
    }
  }
}
