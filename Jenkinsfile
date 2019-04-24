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
        sh 'sudo -u ansadmin scp sm-shop/target/ROOT.war ansadmin@172.31.26.224:/filecopy'
        sh 'sudo -u ansadmin ssh ansadmin@172.31.26.224 ansible-playbook /etc/ansible/shopizerDeploy.yml'
        sh 'sudo -u ansadmin ssh ansadmin@172.31.26.224 sudo -u ansadmin ssh ansadmin@172.31.23.1 /home/ansadmin/apache-tomcat-8.5.40/bin/startup.sh'
        echo '******************* GitHub Release Completed *******************'
      }
    }
    stage('Load Test Data') {
      steps {
        echo '******************* Test Data Load Started *******************'
        sh 'curl -X POST --header \'Content-Type: application/json\' --header \'Accept: application/json\' --header \'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJMT0dJTl9TRVNTSU9OX0lEIjoiNDg1Y2RhODctYWVjZC00MGRmLWIxMmUtNjQ5MTcyZWIyNzk0Iiwic3ViIjoiQWRtaW5pc3RyYXRvciIsImF1ZCI6IkFMTCIsIlBXRF9IQVNIX0NMQUlNIjoiODM5MzE0MjgzIiwiaXNzIjoiQ0EgVGVjaG5vbG9naWVzIiwiVVNFUl9JRCI6IjEiLCJleHAiOjE1NTYyMDM2MzIsImlhdCI6MTU1NjExNzIzMiwiQUNDRVNTX1BFUk1JU1NJT05TIjoie1wiQUxMX1BST0pFQ1RTXCI6WzEwMF19In0.6I2D0G7njXnjrjKX9Kmj1N4TbQ0yVE2o_Hj26nwE8n0\' -d \'{"name":"Publish_shopizer_target_Generator","description":"Publish to shopizer_target using Generator","projectId":2671,"versionId":2672,"type":"PUBLISHJOB","origin":"generation","scheduledTime":1555971081869,"jobs":[],"parameters":{"projectId":2671,"projectVersionId":2672,"generatorId":2676,"configurationId":57}}\' \'http://ec2-18-219-82-61.us-east-2.compute.amazonaws.com:8080/TDMJobService/api/ca/v1/jobs\''
        echo '******************* Test Data Load  Completed *******************'
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
