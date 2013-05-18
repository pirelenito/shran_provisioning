service "ssh" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end

template '/etc/ssh/sshd_config' do
  source 'sshd_config'
  owner 'root'
  group 'root'
  mode 0644

  notifies :restart, "service[ssh]"
end


user "root" do
  action :modify
  password data_bag_item("passwords", "root")["password"]
end

directory "/root/.ssh/" do
  owner "root"
  group "root"
  mode "0744"
  action :create
  recursive true
end

template "/root/.ssh/authorized_keys" do
  source 'authorized_keys.erb'
  owner "root"
  group "root"
  mode 0644

  variables(
    :keys => data_bag_item("ssh", "authorized_keys")["keys"]
  )
end


user "deploy" do
  home "/home/deploy"
  shell "/bin/bash"
  supports :manage_home => true
end

directory "/home/deploy/.ssh/" do
  owner "deploy"
  group "deploy"
  mode "0744"
  action :create
  recursive true
end

template "/home/deploy/.ssh/authorized_keys" do
  source 'authorized_keys.erb'
  owner "deploy"
  group "deploy"
  mode 0644

  variables(
    :keys => data_bag_item("ssh", "authorized_keys")["keys"]
  )
end
