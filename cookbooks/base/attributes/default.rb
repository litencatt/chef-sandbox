default['consul']['version']        = '1.5.1'
default['consul']['download_url']   = "https://releases.hashicorp.com/consul/#{node['consul']['version']}/consul_#{node['consul']['version']}_linux_amd64.zip"
default['consul']['sha256']         = '58fbf392965b629db0d08984ec2bd43a5cb4c7cc7ba059f2494ec37c32fdcb91'

# 通常は0.0.0.0で良いがvagrantの場合にちゃんと設定しないと落ちる
default['consul']['bind_addr']      = node['network']['interfaces'][node['consul']['if']]['addresses'].keys[1]
default['consul']['command_options'] = [
  "-data-dir /var/consul/data",
  "-enable-script-checks"
]
default['consul']['command_options'] << [
  "-server",
  "-bootstrap-expect=#{node.chef_environment == 'production' ? 3 : 1}",
] if node['hostname'] =~ /orchestrator/

default['consul']['config']['enable_script_checks'] = true

default['consul']['service']['name']   = 'consul'
default['consul']['service']['port']   = 80
default['consul']['service']['tags']   = []
default['consul']['service']['checks'] = []

default['consul']['template']['version']      = '0.19.5'
default['consul']['template']['sha256']       = 'e6b376701708b901b0548490e296739aedd1c19423c386eb0b01cfad152162af'
default['consul']['template']['download_url'] = "https://releases.hashicorp.com/consul-template/#{node['consul']['template']['version']}/consul-template_#{node['consul']['template']['version']}_linux_amd64.zip"

