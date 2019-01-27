template '/etc/httpd/conf/httpd.conf' do
  mode 0644
  variables(
    :document_root => node['web']['document_root'],
    :server_name => node['web']['server_name'],
    :max_client => node['web']['max_client'],
  )
  notifies :reload, 'service[httpd]'
end

template '/etc/httpd/conf.modules.d/base.conf' do
  mode 0644
  notifies :reload, 'service[httpd]'
end

cookbook_file '/etc/httpd/conf.d/ssl.conf' do
  source 'ssl.conf'
  notifies :reload, 'service[httpd]'
end
