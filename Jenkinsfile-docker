#!/usr/bin/env groovy

pipeline {

    agent any
	
    stages {
        stage('Build') {
            steps {
                sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-web -t app-1:web /'
		sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-database -t app-1:database /'
		sh 'docker build -f /home/ranul/workspace/Node-App/docker/dockerfile-app-1-phpmyadmin -t app-1:phpmyadmin /'
            }
        }
        stage('Run') {
            steps {
                sh 'docker run -d -p 3000:3000 app-1:web'
		sh 'docker run --name="app-1-database" --env MYSQL_ROOT_PASSWORD=hCX7mcYKHdQZxbx8 -d -t -p 3306:3306 app-1:database'
	        sh 'docker run --name=phpmyadmin-1 --detach --publish 8080:80 --env PMA_HOST=app-1-database app-1:phpmyadmin'
            }
        }
    }
}
