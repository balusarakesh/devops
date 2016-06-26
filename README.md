 - Create a 3 node cassandra cluster including opscenter and add dummy data more then a 2GB, you can download any data from the internet.
 - Take a snapshot of the data using opscenter and try to import the snapshot into a single node cluster.
 - Once successful automate the entire process of setting up the cluster with cloudformation and chef recipes and add a README with clear instructions.

First Part:
- Creating Backups on a three node cluster:
 -  Launch an ec2 instance and install opscenter as per the instructions at http://docs.datastax.com/en/opscenter/5.2/opsc/install/   opscInstallDeb_t.html
 -  open the required ports in the SecurityGroup of the instance and goto http://ec2_instance_public_ip:8888
 -  create a user in IAM and grant full admin access
 -  create a new cassandra cluster with three nodes using the above user credentials at the URL - http://ec2_instance_public_ip:8888
 -  use the python code in the file "generate_random_data.py" to generate random data and store it in data.csv
 -  copy this file into one of the nodes in the cluster created above
 -  run the command "cqlsh ec2_instance_public_ip 9042" to connect to the cluster
 -  create a table named "users"
 -  run the command "copy users (column1,column2,column3,column4,column5) from 'data.csv' with HEADER=TRUE;" to import data from CSV  file to the table
 -  goto the backup services page in the opscenter and create a backup of the table "users" and select the location of an S3 bucket to store the backups

Restoring from into a single node cluster:
 -  Delete the previosly created three node cluster
 -  Repeat the above process but instead select only 1 node at the step 3 and stop after step 3
 -  goto the backup service and restore the backup table from the previously created backups stored in the S3 bucket

Second Part:
 - Creating EC2 Instances:
  -  Create an instance which can be used as the opscenter
  -  Launch three instances which act as nodes using the "cloud_formation_template.json" provided
	Creating Cluster:
  -  bootstrap the opscenter instance to the chef-server
  -  create three recipes "createcluster", "installopsc" and "installpiprequests" using the code provided
  -  add these recipes in the order of "installopsc", "installpiprequests" and "createcluster" to the opsscenter node
   -   installopsc:
      - 	 this recipe is to install the opscenter
   -   installpiprequests:
      - 	 this recipe is to install the python-pip and the python requests packages
   -   createcluster:
      - 	 using the "provision.erb" and "run.erb" templates this recipe can create cassandra cluster
      - 	 make sure to put the proper ipaddresses in those templates
 -  run chef-client to finish the task
