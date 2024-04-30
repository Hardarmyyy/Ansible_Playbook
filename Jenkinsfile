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

	stage('Ansible Credentials & Playbook') {
		
		 steps {
			 ansiblePlaybook([ 
			 inventory: 'inventory',
			 playbook: 'install_Servers.yml',
			 tags: 'updateSystem'
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
