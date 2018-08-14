node('docker'){
    
    stage("SCM Checkout"){
      git 'https://github.com/Amir345/web-ftp.git'  
    }
    stage("building the docker image"){
        sh 'docker build -t web-jenkins-docker .'
    }
    stage("Pushing the docker image on hub"){
        withCredentials([string(credentialsId: 'dock', variable: 'dockerpw')]) {
        sh 'docker login -u amirdock23 -p ${dockerpw}'
    }
        sh 'docker tag web-jenkins-docker amirdock23/docker-ci-cd'
        sh 'docker push amirdock23/docker-ci-cd'

    }
}
node('docker'){stage("Deploy"){
    slackSend baseUrl: 'https://docker-jenkinsgroup.slack.com/services/hooks/jenkins-ci/', channel: 'jenkins-not', message: 'Would you like to proceed with the deployment of ?', tokenCredentialId: 'slack'
}
input 'Do you want to deploy the containers' 
}
node('docker'){
    stage('Deploying the containers'){
    sh 'docker run -d -p 80:80  amirdock23/docker-ci-cd'
    }
}
