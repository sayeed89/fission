pipeline {
    agent any

    stages {
        stage('Hello') {
	  when {
		branch 'main'
		}
            steps {
                sh "echo $BRANCH_NAME" 
            }
        }
    }
}

