service 'httpd'

template "/usr/local/phpenv/versions/#{node['phpenv']['global']}/etc/php.ini" do
  notifies :reload, 'service[httpd]'
end
