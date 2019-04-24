pipeline {
  agent any
  stages {
    stage('Clean') {
      steps {
        echo '******************* Maven Clean Source Code *******************'
        sh 'mvn clean'
        echo '******************* Mave Clean Execution Completed *******************'
      }
    }
    stage('Build') {
      steps {
        echo '******************* Maven Build Source Code *******************'
        sh 'mvn package'
        echo '******************* Mave Build Execution Completed *******************'
      }
    }
    stage('Test') {
      steps {
        echo '******************* Java Unit Testing Started *******************'
        sh 'mvn test'
        echo '******************* Java Unit Testing Execution Completed *******************'
      }
    }
    stage('Release') {
      steps {
        echo '******************* GitHub Release Started *******************'
        echo '******************* GitHub Release Completed *******************'
        sh 'sudo -u ansadmin scp sm-shop/target/ROOT.war ansadmin@172.31.26.224:/filecopy'
        sh 'sudo -u ansadmin ssh ansadmin@172.31.26.224 ansible-playbook /etc/ansible/shopizerDeploy.yml'
      }
    }
  }
  tools {
    maven 'maven'
  }
  post {
    always {
      echo '******************* Post Compile JUnit Reports *******************'
      junit '**/surefire-reports/*.xml'
      echo '******************* JUnit Reports Compiled *******************'

    }

  }
}
