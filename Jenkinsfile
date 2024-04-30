pipeline {

  agent any

  stages {


	 stage('Checkout') {

		 steps {
			 echo 'Source code from github repository'
		 }

	 }

	stage('Ansible Credentials') {
		
		steps {
			echo 'SSH connection to ansible'
		}
	}

  }

  post {

	 success {
		 echo 'Build successful! Artifacts archived.'
	 }

	 failure {
		 echo 'Build failed. Check the logs for details.'
	 }

  }

}
