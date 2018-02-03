package "httpd" do
  action :install
end

service "httpd" do
  action %w(enable start)
end
