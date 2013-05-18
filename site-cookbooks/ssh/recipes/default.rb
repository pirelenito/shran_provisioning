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