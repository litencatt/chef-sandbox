directory '/var/log/httpd' do
  mode '755'
  owner 'root'
  group 'root'
end

%w(
  openssl-devel
  mod_ssl
  httpd-devel
).each do |name|
  package name
end

directory node['web']['document_root'] do
  mode '775'
  owner 'apache'
  group 'apache'
end

service 'httpd' do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

if %w(test vagrant).include?(node.chef_environment)
  directory "/etc/httpd/ssl" do
    owner 'root'
    group 'root'
    mode 0755
  end

  bash "create self-signed keys" do
    environment 'COMMON_NAME' => node['web']['server_name']
    cwd '/etc/httpd/ssl'
    code <<-CODE
      openssl req -x509 -days 36500 -newkey rsa:2048 -nodes \
        -out $COMMON_NAME.crt -keyout $COMMON_NAME.key \
        -subj "/C=/ST=/L=/O=/OU=/CN=$COMMON_NAME"
      chown apache:apache /etc/httpd/ssl/#{node['web']['server_name']}.*
      chmod 600 /etc/httpd/ssl/#{node['web']['server_name']}.*
    CODE
    not_if "test -f /etc/httpd/ssl/#{node['web']['server_name']}.key"
    notifies :restart, 'service[httpd]'
  end
end
