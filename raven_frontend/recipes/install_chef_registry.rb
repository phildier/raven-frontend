# configures ChefRegistry php class
#

directory node[:raven_frontend][:app_path] do
	recursive true
end

raven_app_path = "#{node[:raven_frontend][:app_path]}/current"

if defined?(node[:potg_app][:app_path]) then
	potg_app_path = "#{node[:potg_app][:app_path]}/current"
end

{
	"chef_registry.php.erb" => "/home/webapps/chef_registry.php",
	"chef_registry.json.erb" => "/home/webapps/chef_registry.json"
}.each do |template,destination|
	template destination do
		source template
		user "root"
		mode 0644
		variables ({
				:raven_app_root => raven_app_path,
				:potg_app_root => potg_app_path,
				:gearman_server => node[:raven_frontend][:chef_registry][:gearman_server],
				:sa_gearman_server => node[:raven_frontend][:chef_registry][:sa_gearman_server],
				:prince_gearman_server => node[:raven_frontend][:chef_registry][:prince_gearman_server],
				:reports_gearman_server => node[:raven_frontend][:chef_registry][:reports_gearman_server],
				:session_memcached_servers => node[:raven_frontend][:chef_registry][:session_memcached_servers],
				:cache_memcached_servers => node[:raven_frontend][:chef_registry][:cache_memcached_servers],
				:service_layer => node[:raven_frontend][:chef_registry][:service_layer],
				:server_type => node[:raven_frontend][:chef_registry][:server_type]
				})
	end
end
