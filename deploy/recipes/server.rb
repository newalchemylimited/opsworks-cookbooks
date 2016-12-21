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
end
