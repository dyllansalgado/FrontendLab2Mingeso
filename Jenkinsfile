pipeline {
    agent any
    /* environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	} */
    stages {
        
        stage('Inicio'){
            steps{
                echo "Iniciando"
            } 
        }

        // SonarQube Listo.
        /* stage('SonarQube Scanner') {
             steps{
                    script {
                        def scannerHome = tool 'SonarQube Scanner';
                    }
                withSonarQubeEnv('trabajo2-front') { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=trabajo2-front \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://ec2-3-70-187-29.eu-central-1.compute.amazonaws.com:9000 \
                        -Dsonar.login=e9572cecbbe6bab1aea8e0e2311f54a02c7b5df5"
                }
             }
        } */


        //Docker

        /* stage('Parar la imagen anterior'){
            steps{
                dir("/var/lib/jenkins/workspace/T2-BackEnd/backend"){
				    sh 'docker stop backend || true && docker rm backend || true'	
			    }
            }             
        }

        stage('Contruir imagen docker'){
            steps{
        		dir("/var/lib/jenkins/workspace/T2-BackEnd/backend"){
                 	sh 'docker build . -t backend'	
	         	}
            }             
        }

        stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
        
	    stage('Correr imagen'){
            steps{
        		dir("/var/lib/jenkins/workspace/T2-BackEnd/backend"){
				
				sh 'docker run --rm --name backend -d -p 8000:8000 backend'
	         	}
            }             
        }
        
	    stage('Subir imagen docker a hub'){
                steps{
			        sh 'docker tag backend miige/backend:latest'	
			        sh 'docker push miige/backend:latest'
                }             
        }*/
    } 

}
