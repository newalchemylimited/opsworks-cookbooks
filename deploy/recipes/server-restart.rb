include_recipe 'deploy'

node[:deploy].each do |application, deploy|

  ruby_block "restart server #{application}" do
    block do
      Chef::Log.info("restart server via: #{node[:deploy][application][:server][:restart_command]}")
      Chef::Log.info(`#{node[:deploy][application][:server][:restart_command]}`)
      $? == 0
    end
  end

end
