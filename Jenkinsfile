#!/usr/bin/env groovy
import hudson.model.*
pipeline{
    environment{
        branch = "master"
        ProjectDir = "skipTheDishes-1"
        mvnSettings = "settings.xml"
    }//environment
    agent{label 'master'}
    stages{
        stage('clone'){
            steps{
                script{
                    git(
                        //url: 'https://github.com/fabiokazaki/restaurantes-angular-5.git',
			            url: 'https://github.com/fabiokazaki/skipTheDishes-1.git',                       
			            credentialsId: 'github',
                        branch: "${branch}"
                    )
                }//script
            }//steps
        }//stage
        stage('build'){
            steps{
                script{
                    dir ("people-service"){
                    env.PATH = "{tool 'maven'}/bin:${env.PATH}";
                        sh "mvn -U install -Dpacote=web"
                    }//dir
                }//script
            }//steps
        }//stage
	stage ('clean'){

        	steps{

                    script{

                	dir ("${ProjectDir}"){

                	env.PATH = "${tool 'M3'}/bin:${env.PATH}";

                		sh "/usr/share/maven/bin/mvn clean -DskipTests"

                	}//dir

                    }//script

                }//steps

        }//clean

        stage ('test') {

                steps{

                    script{

            		dir ("${ProjectDir}"){

                	env.PATH = "${tool 'M3'}/bin:${env.PATH}";

                	        sh "/usr/share/maven/bin/mvn test -Diterations=10"

                	}//dir

                    }//script

                }//steps

    	}//test
	stage ('package'){
         	steps{
			dir ("${ProjectDir}"){
				sh '''
				cp /root/.m2/repository/com/skipthedishes/msmarques/com.skipthedishes.msmarques.people/0.0.1-SNAPSHOT/com.skipthedishes.msmarques.people-0.0.1-SNAPSHOT.jar .
				tar -cf people.tar com.skipthedishes.msmarques.people-0.0.1-SNAPSHOT.jar 		
				'''
    }//stages
}//pipeline/
