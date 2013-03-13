package 'nginx' do
  action :install
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  mode 0644
  owner "root"
  group "root"
end