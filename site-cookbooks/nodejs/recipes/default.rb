package 'nodejs' do
  action :install
end

package 'npm' do
  action :install
end

file "/var/log/node.log" do
  owner "www-data"
  group "www-data"
  mode "0775"
  action :create
end

template "/etc/init/go_horse_go.conf" do
  source "go_horse_go.conf"
  mode 0644
  owner "root"
  group "root"

  notifies :restart, "service[go_horse_go]"
end

service 'go_horse_go' do
  provider Chef::Provider::Service::Upstart
end