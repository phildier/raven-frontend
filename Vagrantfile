VAGRANTFILE_API_VERSION = "2"

# load local config overrides
overrides_json = File.dirname(__FILE__)+"/overrides.json"
unless File.exists?(overrides_json)
	raise "Couldn't find #{overrides_json}. See overrides.json.example"
end
config_overrides = JSON.parse(IO.read(overrides_json))


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
	config.vm.box = "raven-centos6"
	config.vm.box_url = "http://raven-opensource.s3.amazonaws.com/raven-centos6.box"

	config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.network "private_network", ip: "10.122.0.11"

	config.vm.synced_folder ".", "/vagrant"

	if config_overrides.has_key?('cookbook_dev_dir') and not config_overrides['cookbook_dev_dir'].nil? then
		config.vm.synced_folder config_overrides['cookbook_dev_dir'], "/development"
	end

	# download data bags
	config.vm.provision :shell, path: "scripts/data_bags.sh"

	# initial non-chef bootstrap
	config.vm.provision :shell, path: "scripts/vagrant_bootstrap.sh"

	# everything else is set up via chef-solo
	config.vm.provision "chef_solo" do |chef|
		chef.install = false
		chef.cookbooks_path = "berks-cookbooks"
		chef.roles_path = "roles"
		chef.add_role "vagrant"
		chef.json = config_overrides
	end

	config.vm.provider :virtualbox do |vb|
		vb.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
		vb.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
	end
end

# vim:set syntax=ruby:
