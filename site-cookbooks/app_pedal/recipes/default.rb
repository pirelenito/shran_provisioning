directory "/www/pedal/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

template "/etc/nginx/sites-available/pedal.pirelenito.org" do
  source "pedal.pirelenito.org"
  mode 0644
  owner "root"
  group "root"
end

link "/etc/nginx/sites-enabled/pedal.pirelenito.org" do
  to "/etc/nginx/sites-available/pedal.pirelenito.org"
  notifies :restart, "service[nginx]"
end

template "/etc/init/pedal.conf" do
  source "pedal.conf"
  mode 0644
  owner "root"
  group "root"

  notifies :restart, "service[pedal]"
end

service 'pedal' do
  provider Chef::Provider::Service::Upstart
end