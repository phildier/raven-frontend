# checkout directory. expect current/ to be appended
default[:raven_frontend][:app_path] = "/home/webapps/raven"

# github repo
default[:raven_frontend][:repository] = "git@github.com:raventools/ravenapp.git"

# branch/tag/has to check out
default[:raven_frontend][:revision] = "master"

# app document root
default[:raven_frontend][:docroot] = "."

# vhost domains
default[:raven_frontend][:domains] = ["ravenvagrant.site"]

# vhost listen port
default[:raven_frontend][:port] = 80

# chef registry parameters
default[:raven_frontend][:chef_registry][:gearman_server] = "127.0.0.1:4730"
default[:raven_frontend][:chef_registry][:sa_gearman_server] = "127.0.0.1:4730"
default[:raven_frontend][:chef_registry][:prince_gearman_server] = "127.0.0.1:4730"
default[:raven_frontend][:chef_registry][:reports_gearman_server] = "127.0.0.1:4730"
default[:raven_frontend][:chef_registry][:session_memcached_servers] = ["127.0.0.1"]
default[:raven_frontend][:chef_registry][:cache_memcached_servers] = ["127.0.0.1"]
default[:raven_frontend][:chef_registry][:service_layer] = "frontend"
default[:raven_frontend][:chef_registry][:server_type] = "production"

# gearman worker parameters
default[:raven_frontend][:gearman][:worker] = false
default[:raven_frontend][:gearman][:recycle_after_exec] = 10
default[:raven_frontend][:gearman][:metapackage] = "everything"
default[:raven_frontend][:gearman][:numprocs] = 10
