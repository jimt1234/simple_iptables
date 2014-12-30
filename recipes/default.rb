#
# Cookbook Name:: simple_iptables
# Recipe:: default
#

def create_iptables_conf_file(file)
  template "#{file}" do
    path "#{file}"
    source "iptables.erb"
    owner "root"
    group "root"
    mode 00600
  end
end

case node[:platform_family]
when "rhel"
  file="/etc/sysconfig/iptables"
  create_iptables_conf_file(file)
  execute "service iptables restart" do
    user "root"
    command "service iptables restart"
  end
when "debian"
  file="/etc/iptables/rules.v4"
  directory File.dirname(file) do
    owner "root"
    group "root"
    mode 00644
    action :create
  end
  create_iptables_conf_file(file)
  execute "apply iptables rules" do
    command "iptables-restore < #{file}"
    user "root"
  end
  package "iptables-persistent" do
    action :install
  end
end
