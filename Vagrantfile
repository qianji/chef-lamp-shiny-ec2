# -*- mode: ruby -*-
# vi: set ft=ruby :
# This is a Vagrant configuration file. It can be used to set up and manage
# virtual machines on your local system or in the cloud. See http://downloads.vagrantup.com/
# for downloads and installation instructions, and see http://docs.vagrantup.com/v2/
# for more information and configuring and using Vagrant.

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "http://devopera.com/node/63/download/ubuntu1204/dobu12-lamp-vagrant.box"

  # This can be set to the host name you wish the guest machine to have. Vagrant
  # will automatically execute the configuration necessary to make this happen.
  config.vm.hostname = "weitingtang-starter"

  config.omnibus.chef_version = :latest
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # port 8080 on the virtual machine is forwarded to port 9090 on the host.
  # This will allow the virtual machine to communicate of the common proxy port 8080.
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.10"
  #config.vm.share_folder("www", "/srv/www/htdocs", "./www") 

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "./www", "/var/www"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider :virtualbox do |vb|
     # Don't boot with headless mode
     #vb.gui = true
  
     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--memory", "2048"]
   end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
   #config.vm.provision :chef_solo do |chef|
     #chef.cookbooks_path = "cookbooks"
     #chef.roles_path = "roles"
     #chef.data_bags_path = "data_bags"
     #chef.add_recipe "mysql"
     #chef.add_role "web"
  
     ## You may also specify custom JSON attributes:
     #chef.json = { :mysql_password => "foo" }
   #end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
   #config.vm.provision :chef_client do |chef|
     #chef.chef_server_url = "https://api.opscode.com/organizations/mrb"
     #chef.validation_client_name = "mrb-validator"
     #chef.validation_key_path = ".chef/mrb-validator.pem"
   #end
   # Your organization name for hosted Chef 
  orgname = "mrb"

  # Set the Chef node ID based on environment variable NODE, if set. Otherwise default to vagrant-$USER
  node = ENV['NODE']
  node ||= "vagrant-#{ENV['USER']}"

  config.vm.provision :chef_client do |chef|
    chef.chef_server_url = "https://api.opscode.com/organizations/#{orgname}"
    chef.validation_key_path = ".chef/#{orgname}-validator.pem"
    chef.validation_client_name = "#{orgname}-validator"
    chef.encrypted_data_bag_secret_key_path = ".chef/encrypted_data_bag_secret"
    chef.node_name = "#{node}"
    #chef.provisioning_path = "/etc/chef"
    #chef.log_level = :debug
    #chef.log_level = :info

    chef.environment = "dev" 
    chef.add_role("base")
    chef.add_role("db_master")
    chef.add_role("webserver")

    #chef.json.merge!({ :mysql_password => "foo" }) # You can do this to override any default attributes for this node.
  end 
end
