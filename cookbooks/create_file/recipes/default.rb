#
# Cookbook Name:: create_file
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
file '/tmp/myenvironment' do
  content node.chef_environment
end
