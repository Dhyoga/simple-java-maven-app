node {
    checkout scm
    stage('Build') {
        docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
                sh 'mvn -B -DskipTests clean package'
        }
    }
    stage('Test') {
        try {
                docker.image('maven:3.8.6-eclipse-temurin-18-alpine').inside('-v /root/.m2:/root/.m2') {
                        sh 'mvn test'
                }
        } catch (e) {
                echo "Test Stage Gagal!"
        } finally {
                echo "Test Stage Berhasil!"
                junit 'target/surefire-reports/*.xml'
        }
    }
    stage('Manual Approval'){
        input message: 'Gas Deploy?',
        ok: 'Proceed'
    }
    stage('Deploy') {
        archiveArtifacts 'target/my-app-1.0-SNAPSHOT.jar'
        docker.build("myapp-java:latest");
        sh "ssh-keyscan -H 13.228.28.89 >> ~/.ssh/known_hosts"
        sh "/usr/bin/scp -i /var/jenkins_home/myapp-java-server.pem /var/jenkins_home/workspace/submission-cicd-pipeline-dhyoga/target/my-app-1.0-SNAPSHOT.jar ubuntu@13.228.28.89:/home/ubuntu/myapp-java-1.0-SNAPSHOT.jar"
        sh 'docker run --rm myapp-java'
        sleep 60
    }
}