include_recipe 'phpenv'

phpenv_build node['phpenv']['phps']
phpenv_global node['phpenv']['global']
