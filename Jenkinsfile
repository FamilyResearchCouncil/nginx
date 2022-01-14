#!/usr/bin/env groovy
node('master') {
    checkout scm
    docker.withRegistry('', 'dockerhub-creds'){
        def image = '';

        stage('build') {
            image = docker.build("familyresearchcouncil/nginx", './')

        }

        stage('push') {
            image.push()

            image.push("${env.BRANCH_NAME}")
        }
    }
}
