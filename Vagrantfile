Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: [
    ".git/",
    "vendor/bundle"
  ]

  proxy = {
    ip: '192.168.33.10',
    hostname: :proxy01
  }

  app = {
    ip: '192.168.33.11',
    hostname: :app01
  }

  sandbox = {
    ip: '192.168.33.12',
    hostname: :app02
  }

  def _configure(chef)
    chef.version = '13.10'
    chef.cookbooks_path = %w(cookbooks vendor/cookbooks)
    chef.roles_path = 'roles'
    chef.nodes_path = 'nodes'
    chef.data_bags_path = 'data_bags'
    chef.synced_folder_type = 'nfs'
    chef.encrypted_data_bag_secret_key_path = ".chef/secret_data_bag_key"
    chef.environments_path = 'environments'
    chef.environment = 'vagrant'
  end

  def define_machine_spec(config, properties)
    memory = properties.memory || 512
    cpus   = properties.core   || 2
    config.vm.provider :virtualbox do |vbox|
      vbox.customize ["modifyvm", :id, "--memory", memory.to_i]
      vbox.customize ["modifyvm", :id, "--cpus", cpus.to_i]
    end
  end

  config.vm.define :proxy do |c|
    c.vm.network :private_network, ip: proxy[:ip]
    c.vm.hostname = proxy[:hostname]
    c.vm.provision :chef_zero do |chef|
      _configure chef
      chef.add_role 'base'
      chef.add_role 'proxy'
    end
  end

  config.vm.define :app do |c|
    c.vm.network :private_network, ip: app[:ip]
    c.vm.hostname = app[:hostname]
    c.vm.provision :chef_zero do |chef|
      _configure chef
      chef.add_role 'base'
      chef.add_role 'app'
    end
  end

  config.vm.define :sandbox do |c|
    c.vm.network :private_network, ip: sandbox[:ip]
    c.vm.hostname = sandbox[:hostname]
    c.vm.provision :chef_zero do |chef|
      _configure chef
      chef.add_role 'base'
    end
  end
end
