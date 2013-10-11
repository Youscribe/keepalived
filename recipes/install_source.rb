include_recipe "build-essential"
include_recipe "ark"

package "libpopt-dev"

is_installed_command = "keepalived -v 2>&1 >/dev/null | grep -qF #{node['keepalived']['version']}"

ark "keepalived" do
  url "http://www.keepalived.org/software/keepalived-#{node['keepalived']['version']}.tar.gz"
  autoconf_opts node['keepalived']['config_opts'] if node['keepalived']['config_opts']
  not_if is_installed_command
  version node['keepalived']['version']
  action [ :install ]
end
