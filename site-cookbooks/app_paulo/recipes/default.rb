directory "/www/paulo/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

template "/etc/nginx/sites-available/paulo.ragonha.me" do
  source "paulo.ragonha.me"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/paulo.ragonha.me" do
  to "/etc/nginx/sites-available/paulo.ragonha.me"
end

# jasmine keynote at TDC 2013

directory "/www/tdc2013_jasmine/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

directory "/www/talks" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end
