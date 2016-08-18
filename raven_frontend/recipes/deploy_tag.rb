include_recipe "raven_frontend"

node.override[:app_frontend][:cache_dir] = "#{node[:raven_deploy][:cache_dir]}/ravenapp_cache"

raven_deploy_app "ravenapp" do
	path node[:raven_frontend][:app_path]
	repository node[:raven_frontend][:repository]
	revision node[:raven_frontend][:revision]
	docroot node[:raven_frontend][:docroot]
	domains node[:raven_frontend][:domains]
	port node[:raven_frontend][:port].to_i
end
