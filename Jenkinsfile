#!/usr/bin/env groovy

pipeline {
  agent { 
	  label 'kubernetes-master-1'
  }
	
  stages {
    
    stage('Build docker images') {
      steps {
	      sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-nginx -t ranuldeepanayake/private:nginx-$GIT_BRANCH-$BUILD_NUMBER /'
        sh 'docker push ranuldeepanayake/private:nginx-$BUILD_NUMBER-$GIT_BRANCH'
      }
    }

    stage('Deploy on Kubernetes') {
      steps {
        sh "sed -i 's/DEPLOYMENT_NAME/$GIT_BRANCH/g' /home/ranul/workspace/Node-App/kubernetes/nginx-deployment.yml"
        sh "sed -i 's/SERVICE_NAME/$GIT_BRANCH/g' /home/ranul/workspace/Node-App/kubernetes/nginx-service.yml"
        sh "sed -i 's/BUILD_NUMBER/$BUILD_NUMBER-$GIT_BRANCH/g' /home/ranul/workspace/Node-App/kubernetes/nginx-deployment.yml"

        script {
          if ($GIT_BRANCH== "master"){
            sh "sed -i 's/NODE_PORT/30000/g' /home/ranul/workspace/Node-App/kubernetes/nginx-service.yml"

          }else if ($GIT_BRANCH== "dev"){
            sh "sed -i 's/NODE_PORT/35000/g' /home/ranul/workspace/Node-App/kubernetes/nginx-service.yml"

          }else{
            sh "sed -i 's/NODE_PORT/40000/g' /home/ranul/workspace/Node-App/kubernetes/nginx-service.yml"
          }
        }

        sh 'kubectl apply -f /home/ranul/workspace/Node-App/kubernetes/nginx-deployment.yml'
	      sh 'kubectl apply -f /home/ranul/workspace/Node-App/kubernetes/nginx-service.yml'
        //sh 'kubectl set image deployment/nginx-deployment nginx=ranuldeepanayake/private:nginx-$BUILD_NUMBER'
        //sh 'kubectl set image deployment/nginx-deployment nginx=private:nginx-"$BUILD_NUMBER"'
      }
    }
  }
}
