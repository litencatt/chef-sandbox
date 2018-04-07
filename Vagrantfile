Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.network :private_network, ip: '192.168.33.10'
  config.vm.box = "centos/7"

  base = {
    ip: '192.168.33.10',
    hostname: :base
  }

  config.vm.define :base do |c|
    c.vm.network :private_network, ip: base[:ip]
    c.vm.hostname = base[:hostname]
  end
end
