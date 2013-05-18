user "deploy" do
  password node[:user][:password]
  home "/home/deploy"
  shell "/bin/bash"
  supports :manage_home => true
end