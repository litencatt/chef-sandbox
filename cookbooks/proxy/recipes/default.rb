# Cookbook Name:: base
# Recipe:: default

include_recipe 'motd'
include_recipe 'nginxxx'

%w(
  /etc/nginx/ssl
).each do |dir|
  directory dir do
    owner 'root'
    group 'root'
    mode 0755
  end
end

bash "create self-signed keys" do
  environment 'COMMON_NAME' => node['proxy']['fqdn']
  cwd '/etc/nginx/ssl'
  code <<-CODE
    openssl req -x509 -days 36500 -newkey rsa:2048 -nodes \
            -out $COMMON_NAME.crt -keyout $COMMON_NAME.key \
            -subj "/C=/ST=/L=/O=/OU=/CN=$COMMON_NAME"
    chown nginx:nginx /etc/nginx/ssl/#{node['proxy']['fqdn']}.*
    chmod 600 /etc/nginx/ssl/#{node['proxy']['fqdn']}.*
  CODE
  not_if "test -f /etc/nginx/ssl/#{node['proxy']['fqdn']}.key"
  notifies :restart , 'service[nginx]'
end

template "/etc/nginx/sites-available/#{node['proxy']['fqdn']}" do
  source 'nginx.proxy.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :create, "link[/etc/nginx/sites-enabled/#{node['proxy']['fqdn']}]"
  notifies :restart, 'service[nginx]'
end

link "/etc/nginx/sites-enabled/#{node['proxy']['fqdn']}" do
  to "/etc/nginx/sites-available/#{node['proxy']['fqdn']}"
  notifies :restart , 'service[nginx]'
  only_if "test -f /etc/nginx/sites-available/#{node['proxy']['fqdn']}"
end
