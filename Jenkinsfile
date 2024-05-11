pipeline {

  agent  {
		label "agent-node-1"
	 }

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
			 playbook: 'install_servers.yml',
			 limit: 'node1',
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
		
		archiveArtifacts artifacts: '**/*', excludes: 'temp/**, *.log', allowEmptyArchive: true

                 echo 'Build successful! Artifacts archived.'

		cleanWs()
	 }

	 failure {
		 echo 'Build failed. Check the logs for details.'
	 }

  }

}
