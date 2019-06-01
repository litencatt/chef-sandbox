# Cookbook Name:: base
# Recipe:: default

include_recipe 'yum'
include_recipe 'git'

%w(epel-release).each do |pkg|
  package pkg
end

include_recipe 'base::consul'
