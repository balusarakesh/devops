#
# Cookbook Name:: installpiprequests
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "python-pip" do
	action :install
end

execute "pip install requests" do
	action :run
end
