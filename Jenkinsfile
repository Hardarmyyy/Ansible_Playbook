pipeline {

  agent any

  stages {
	

	 stage('Add Ansible credentials') {

		 steps {
			 withCredentials([sshUserPrivateKey(credentialsId: f336b10b-519d-48d5-bc09-bd1faa01741f )]) {
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
