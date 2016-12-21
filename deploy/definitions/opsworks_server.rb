define :opsworks_server do
  deploy = params[:deploy_data]
  application = params[:app]

  service 'monit' do
    action :nothing
  end

  template "#{node.default[:monit][:conf_dir]}/golang-#{application}.monitrc" do
    source 'server.monitrc.erb'
    cookbook 'opsworks_server'
    owner 'root'
    group 'root'
    mode '0644'
    variables(
      :deploy => deploy,
      :application_name => application,
      :monitored_script => "#{deploy[:deploy_to]}/current/server"
    )
    notifies :restart, "service[monit]", :immediately
  end
end
