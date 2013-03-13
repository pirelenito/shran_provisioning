user "deploy" do
  password node[:user][:password]
  home "/home/deploy"
  shell "/bin/bash"
  supports :manage_home => true
end

directory "/www/paulo/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

directory "/www/moood/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end

directory "/www/jujuca/" do
  owner "deploy"
  group "deploy"
  mode "0775"
  recursive true
  action :create
end