#
# Use Basho APT repository
#

package 'apt-transport-https'

apt_repository 'basho' do
  uri          'http://apt.basho.com'
  distribution node['lsb']['codename']
  components   ["main"]
  key          'https://packagecloud.io/gpg.key'

  action :add
end

package 'riak' do
  version node.riak.version
end

#
# - Stop riak service to customize configuration files
# - Don't enable riak service at server boot time
#
service 'riak' do
  action [:disable, :stop]
end

template "/etc/riak/app.config" do
  source "app.config.erb"
  owner  'riak'
  group  'riak'
  mode   0644
end

template "/etc/riak/vm.args" do
  source "vm.args.erb"
  owner  'riak'
  group  'riak'
  mode   0644
end
