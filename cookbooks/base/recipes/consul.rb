include_recipe 'consul'

user 'consul' do
  shell '/bin/bash'
  system true
  gid 'consul'
  comment 'Service user for consul'
  not_if 'getent passwd consul'
end

directory '/var/consul' do
  owner 'consul'
  group 'consul'
  mode '0775'
end

service 'consul' do
  action %w(start enable)
end
