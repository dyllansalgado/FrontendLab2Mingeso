pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        
        stage('Inicio'){
            steps{
                echo "Iniciando"
            } 
        }

        // SonarQube Listo.
        stage('SonarQube Scanner') {
             steps{
                    script {
                        scannerHome = tool 'SonarQube Scanner';
                    }
                withSonarQubeEnv('trabajo2-front') { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=frontendMingeso \
                        -Dsonar.sources=. \
                        -Dsonar.host.url=http://161.35.187.91:9000/ \
                        -Dsonar.login=b6608745dcdb00582c7b12570eabbac100299d95"
                }
             }
        }


        //Docker

        stage('Parar la imagen anterior'){
            steps{
                dir("/var/lib/jenkins/workspace/frontend/frontend"){
				    sh 'docker stop frontend || true && docker rm frontend || true'	
			    }
            }             
        }

        stage('Contruir imagen docker'){
            steps{
        		dir("/var/lib/jenkins/workspace/frontend/frontend"){
                 	sh 'docker build . -t frontend'	
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
        		dir("/var/lib/jenkins/workspace/frontend/frontend"){
				
				sh 'docker run --rm --name frontend -d -p 3000:3000 frontend'
	         	}
            }             
        }
        
	    stage('Subir imagen docker a hub'){
                steps{
			        sh 'docker tag frontend miige/frontend:latest'	
			        sh 'docker push miige/frontend:latest'
                }             
        }
    } 

}
