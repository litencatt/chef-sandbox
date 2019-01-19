package 'patch'

cookbook_file "#{node['phpenv']['root_path']}/plugins/php-build/share/php-build/default_configure_options" do
  source 'default_configure_options'
  user node['phpenv']['user']
  group node['phpenv']['group']
end

cookbook_file "#{node['phpenv']['root_path']}/plugins/php-build/share/php-build/patches/php-build.patch" do
  source 'php-build.patch'
end

bash 'run php-build patch' do
  not_if "cat #{node['phpenv']['root_path']}/plugins/php-build/bin/php-build | grep -q 'apxs -q LIBEXECDIR'"
  code "cd #{node['phpenv']['root_path']}/plugins/php-build;patch -p0 < share/php-build/patches/php-build.patch"
end

phpenv_build node['phpenv']['phps']
phpenv_global node['phpenv']['global']

if node['phpenv']['mod_php']
  link '/etc/httpd/modules/libphp5.so' do
    to "#{node['phpenv']['root_path']}/versions/#{node['phpenv']['mod_php']}/libexec/libphp5.so"
  end

  link '/etc/php5' do
    to "#{node['phpenv']['root_path']}/versions/#{node['phpenv']['mod_php']}/etc"
  end
end
