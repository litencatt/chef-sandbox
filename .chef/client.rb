current_dir = '/opt/chef'
cookbook_path ["#{current_dir}/cookbooks", "#{current_dir}/vendor/cookbooks"]
role_path "#{current_dir}/roles"
environment_path "#{current_dir}/environments"
node_path "#{current_dir}/nodes"
file_cache_path '/var/chef/cache'
