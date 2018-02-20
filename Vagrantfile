Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |vb|
    vb.name = "apacheVagrant"
    vb.memory = "1024"

  end

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.box = "apache"
  #	config.vm.network "public_network", type: "dhcp"
  #	config.vm.provision :shell, path: "./provision/bootstrap.sh"

end