local_mode true

role_path     "roles"
cookbook_path ["cookbooks", "vendor/cookbooks"]

data_bag_path "data_bags"
encrypted_data_bag_secret "secret_data_bag_key"

knife[:ssh_attribute] = "knife_zero.host"
knife[:use_sudo] = true
knife[:secret_file] = ".chef/secret_data_bag_key"

knife[:override_attribute_whitelist] = []
knife[:default_attribute_whitelist] = []
knife[:automatic_attribute_whitelist] = %w[
  fqdn
  os
  os_version
  hostname
  ipaddress
  roles
  recipes
  ipaddress
  platform
  platform_version
  cloud
  cloud_v2
]
