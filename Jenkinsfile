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
			 ansiblePlaybook([ 
			 inventory: 'inventory',
			 playbook: 'initialSystemSetup.yml',
			 installation: 'ansible',
			 colorized: true,
			 credentialsId: 'ansible-private-key',
			 disableHostKeyChecking: true
               ]) 
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
