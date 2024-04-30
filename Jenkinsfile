pipeline {

  agent any

  stages {

	 stage ('clean Workspace') {

		 steps {
			cleanWs()
		 }
         }	

	 stage('Checkout') {

		 steps {
			git branch: 'main', url: 'https://github.com/Hardarmyyy/Ansible_Playbook.git'

			 echo 'Source code from github repository'
		 }

	 }

	stage('Ansible Credentials') {
		
                 steps {
				 withCredentials([sshUserPrivateKey( credentialsId: 'Ansible_Private_Key' )]) {
					 echo 'SSH connection to ansible'
				 }
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
