Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  proxy = {
    ip: '192.168.33.10',
    hostname: :proxy01
  }

  config.vm.define :proxy do |c|
    c.vm.network :private_network, ip: proxy[:ip]
    c.vm.hostname = proxy[:hostname]
  end
end
