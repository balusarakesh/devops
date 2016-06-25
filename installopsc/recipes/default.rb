#
# Cookbook Name:: installopsc
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


template "/root/repo_key" do
	source "repo_key.erb"
end

template "/etc/apt/sources.list.d/datastax.community.list" do
	source "community.erb"
end

execute "sudo apt-key add /root/repo_key" do
	action :run
end

execute "sudo apt-get update" do
	action :run
end

template "/etc/opscenter/opscenterd.conf" do
	source "opscenterd.conf.erb"
end

package "opscenter" do
	action :install
end
