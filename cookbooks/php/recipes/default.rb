remote_file "#{Chef::Config[:file_cache_path]}/epel-release-latest-7.noarch.rpm" do
  source "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
  action :create_if_missing
end

remote_file "#{Chef::Config[:file_cache_path]}/remi-release-7.rpm" do
  source "http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
  action :create_if_missing
end

yum_package "yum-utils"

bash "set_php56" do
  code <<-EOH
    yum-config-manager --enable remi-php56
  EOH
end

%w(
  php
  php-mcrypt
  php-cli
  php-gd
  php-curl
  php-mysql
  php-ldap
  php-zip
  php-fileinfo
).each do |pkg|
  package pkg
end
