include_recipe 'deploy'

node[:deploy].each do |application, deploy|

  opsworks_deploy_user do
    deploy_data deploy
  end

  opsworks_deploy do
    app application
    deploy_data deploy
  end

  opsworks_server do
    deploy_data deploy
    app application
  end

  application_environment_file do
    user deploy[:user]
    group deploy[:group]
    path ::File.join(deploy[:deploy_to], "shared")
    environment_variables deploy[:environment_variables]
  end

end
