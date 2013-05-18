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