#!/usr/bin/env groovy

pipeline {
  agent { 
	  label 'kubernetes-master-1'
  }
	
  stages {
    
    /*stage('Build docker images') {
      steps {
	      sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-nginx -t ranuldeepanayake/private:nginx-$BUILD_NUMBER /'
        sh 'docker push ranuldeepanayake/private:nginx-$BUILD_NUMBER'
      }
    }*/

    stage('Deploy on Kubernetes') {
      steps {
        sh "sed -i 's/BUILD_NUMBER/$BUILD_NUMBER/g' /home/ranul/workspace/Node-App/kubernetes/nginx-deployment.yml"
        sh 'kubectl apply -f /home/ranul/workspace/Node-App/kubernetes/nginx-deployment.yml'
	      sh 'kubectl apply -f /home/ranul/workspace/Node-App/kubernetes/nginx-service.yml'
        //sh 'kubectl set image deployment/nginx-deployment nginx=ranuldeepanayake/private:nginx-$BUILD_NUMBER'
        //sh 'kubectl set image deployment/nginx-deployment nginx=private:nginx-"$BUILD_NUMBER"'
      }
    }
  }
}
