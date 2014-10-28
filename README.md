
Getting Started
-------------------------
1. Following the link to install chefdk: https://docs.getchef.com/install_dk.html. Make sure to "Set the System Ruby" in the tutorial. Thing will mess up if you don't set the path of ruby as /opt/chefdk/embedded/bin/ruby
2. Following the link to install knife ec2: http://docs.getchef.com/plugin_knife_ec2.html
3. git clone https://github.com/qianji/chef-lamp-shiny-ec2.git
4. Go to the folder chef-lamp-shiny-ec2
5. Replace 'Your AWS Access KEY ID','Your AWS Secrete Access Key', 'Your AWS Key Name', 'Your AWS SSH Key', 'EC2 Type' and Run the following command:  knife ec2 server create   --availability-zone us-east-1a   --node-name data_analysis  --flavor 'EC2 Type'   --image ami-d87dc6b0   --identity-file 'Your AWS SSH key'   --run-list "role[base],role[db_master],role[webserver]"   --ssh-user ubuntu -A 'Your AWS Access KEY ID'  -K 'Your AWS Secrete Access Key' -S 'Your AWS Key Name'                          
6. The parameter of running knife ec2 can be found here: http://docs.getchef.com/plugin_knife_ec2.html. My example of the command is: knife ec2 server create   --availability-zone us-east-1a   --node-name data_analysis   --flavor t2.micro   --image ami-d87dc6b0   --identity-file ~/.ssh/data_analysis.pem   --run-list "role[base],role[db_master],role[webserver]"   --ssh-user ubuntu -A AKIAI4OZYSQ -K eOGuNzthA5ISCAnXjW9sE/suJR -S data_analysis
