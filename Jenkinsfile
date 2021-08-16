#!/usr/bin/env groovy
node('master') {
    checkout scm
    docker.withRegistry('', 'dockerhub-creds'){
        stage('build') {
            def image = docker.build("familyresearchcouncil/oracle", './')

            if( env.BRANCH_NAME == 'master' ){
                image.push()
            }
        }
    }
}
