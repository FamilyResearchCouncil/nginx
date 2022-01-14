#!/usr/bin/env groovy
node('master') {
    checkout scm
    docker.withRegistry('', 'dockerhub-creds'){
        stage('build') {
            def image = docker.build("familyresearchcouncil/nginx", './')

        }

        stage('push'){
            image.push()
            image.push("${env.BRANCH_NAME}")
        }
    }
}
