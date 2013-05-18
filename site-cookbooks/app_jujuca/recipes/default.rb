directory "/www/jujuca/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

template "/etc/nginx/sites-available/jujuca.com" do
  source "jujuca.com"
  mode 0644
  owner "root"
  group "root"
end

link "/etc/nginx/sites-enabled/jujuca.com" do
  to "/etc/nginx/sites-available/jujuca.com"
  notifies :restart, "service[nginx]"
end