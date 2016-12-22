node[:deploy].each do |application, deploy|

  ruby_block "stop server #{application}" do
    block do
      Chef::Log.info("stop server via: #{node[:deploy][application][:server][:stop_command]}")
      Chef::Log.info(`#{node[:deploy][application][:server][:stop_command]}`)
      $? == 0
    end
  end

end
