#
# Cookbook Name:: system_info
# Recipe:: default
#
# Copyright 2014, Travis CI GmbH
#
# MIT License
#

git '/usr/local/system_info' do
  repository 'https://github.com/travis-ci/system_info.git'
  revision 'master'
  action :sync
  user  node.travis_build_environment.user
  group node.travis_build_environment.group
end
