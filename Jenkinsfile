pipeline {
    agent any 
    stages {
        stage('Cleanup') {
            steps {
                cleanWs()
            }
        }
        stage('Cloning the Docker Repo') {
            steps {
                sh ''' #!/bin/bash
                Branch=apache
                git clone -b $Branch --single-branch https://github.com/sayeed89/fission.git
                cd fission
                git checkout $Branch
                git pull
                '''
            }
        }
        stage('Running Docker') {            
            steps {
                sh ''' #!/bin/bash
                cd fission
                sudo docker  build -t apache-image .
                sudo docker run --name apache-container -it -d -p 8081:8080 apache-image
                '''
            }
        }
        stage('Validating the docker') {
            steps {
                sh ''' #!/bin/bash
                sudo docker images
                sudo docker ps -a
                '''
            }
        }
        stage('Checking the docker application') {
            steps {
                sh ''' #!/bin/bash
                num=`curl -Is http://15.207.110.2:8081/sample/ | grep 200 | cut -f2 -d ' '`
                if [ "$num" = "200" ]; then
                    echo "Docker Apache Application is Up and Running"
                fi
                '''
            }
        }
    }   
    post {
        success {
            archiveArtifacts artifacts: '**', fingerprint: true
        }
    }
}
