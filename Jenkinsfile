pipeline {

  agent any

  stages {
	
	 stage('Checkout') {

		steps {
			git 'https://github.com/Hardarmyyy/Ansible_Playbook'
			echo "Connecting to Github repository to source for code ..."
		}
	
	 }

	 stage('Add Ansible credentials') {

		 steps {
			 withCredentials([sshCredentials(credentialsId: 'Ansible_Private_key' )]) {
			 echo "Credentials added for ssh to remote systems ..."
			}
		 }

	 }

	 stage('Run Ansible Playbook') {
		
		steps {
			sh 'ansible all -m ping'
			echo "Testing connection to all remote systems"
		}

	 }

	 stage('Archive Artifacts') {

		 steps {
			 archiveArtifacts artifacts: '**/*', allowEmptyArchive: true
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
