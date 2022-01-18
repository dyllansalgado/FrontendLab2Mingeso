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
	    
	/*stage('Selenium Test'){
		steps{
			catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE'){
        		dir("/var/lib/jenkins/workspace/frontend/TestSelenium"){
            			sh 'chmod +x ./gradlew'
                        	sh './gradlew test'
        		}
    		}
		
		}
		
		
	}*/

        // SonarQube Listo.
        stage('SonarQube Scanner') {
             steps{
                    script {
                        scannerHome = tool 'SonarQube Scanner';
                    }
                withSonarQubeEnv('front') { // If you have configured more than one global server connection, you can specify its name
                    sh "${scannerHome}/bin/sonar-scanner \
                          -Dsonar.projectKey=front \
			  -Dsonar.sources=. \
			  -Dsonar.host.url=http://161.35.187.91:9000 \
			  -Dsonar.login=fe2cf601e9feee2790c9d6622cbd100a7211fb1e"
                }
             }
        }

        //Docker

        stage('Parar la imagen anterior'){
            steps{
                dir("/var/lib/jenkins/workspace/frontend"){
				    sh 'docker stop frontend || true && docker rm frontend || true'	
			    }
            }             
        }

        stage('Contruir imagen docker'){
            steps{
        		dir("/var/lib/jenkins/workspace/frontend"){
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
        		dir("/var/lib/jenkins/workspace/frontend"){
				
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
