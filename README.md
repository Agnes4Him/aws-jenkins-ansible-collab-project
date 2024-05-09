# aws-jenkins-ansible-collab-project

This project involves this workflow...

1. Provision all infrastructures using terraform - Jenkins server, Ansible server, Instance for running the container for the application
2. Trigger build pipeline on Jenkins to build the artifact of the java spring-petclinic application, and copy the artifact to Ansible server using SSH
3. Ansible server will connect to the cloud instance (managed host) to build a docker image of the java jar file, the run the container on the instance
