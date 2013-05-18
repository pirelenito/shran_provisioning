directory "/www/moood/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

template "/etc/nginx/sites-available/moood.me" do
  source "moood.me"
  mode 0644
  owner "root"
  group "root"
end

link "/etc/nginx/sites-enabled/moood.me" do
  to "/etc/nginx/sites-available/moood.me"
  notifies :restart, "service[nginx]"
end