pipeline {

  agent any

  stages {


	 stage('Checkout') {

		 steps {
			 echo 'Source code from github repository'
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
