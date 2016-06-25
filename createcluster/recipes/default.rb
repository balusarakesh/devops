#
# Cookbook Name:: createcluster
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/root/run.py" do
	source "run.erb"
end

template "/root/provision.json" do
	source "provision.erb"
end

execute "python /root/run.py" do
	action :run
end
