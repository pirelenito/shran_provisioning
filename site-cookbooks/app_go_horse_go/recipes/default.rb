directory "/www/go_horse_go/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

template "/etc/nginx/sites-available/ghg.pirelenito.org" do
  source "ghg.pirelenito.org"
  mode 0644
  owner "root"
  group "root"
end

link "/etc/nginx/sites-enabled/ghg.pirelenito.org" do
  to "/etc/nginx/sites-available/ghg.pirelenito.org"
  notifies :restart, "service[nginx]"
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