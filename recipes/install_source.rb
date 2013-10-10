include_recipe "build-essential"
include_recipe "ark"

is_installed_command = "keepalived -v 2>&1 >/dev/null | grep -qF #{node['keepalived']['version']}"

ark "Install keepalived from sources" do
  url "http://www.keepalived.org/software/keepalived-#{node['keepalived']['version']}.tar.gz"
  autoconf_opts node['keepalived']['config_opts'] if node['keepalived']['config_opts']
  action :install_with_make
  not_if is_installed_command
end