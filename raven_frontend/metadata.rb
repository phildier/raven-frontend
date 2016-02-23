name             'raven_frontend'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures raven_frontend'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "raven-deploy"
depends "raven-supervisor"
depends "raven-gearman"

recipe "raven_frontend::default", "set up frontend dependencies"
recipe "raven_frontend::deploy_tag", "deploys the app"
recipe "raven_frontend::gearman_workers", "configures gearman workers"
recipe "raven_frontend::install_chef_registry", "installs chef registry config"

attribute "raven_frontend",
    :display_name => "Site Auditor Grid",
    :type => "hash"

attribute "raven_frontend/app_path",
    :display_name => "Application Path",
    :description => "Path where application is checked out. Will have 'current' appended",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven_frontend::deploy_tag","raven_frontend::install_chef_registry"],
    :default => "/home/webapps/raven"

attribute "raven_frontend/repository",
    :display_name => "Application Repository",
    :description => "Repository in which the app resides",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven_frontend::deploy_tag"],
    :default => "git@github.com:raventools/raven_frontend.git"

attribute "raven_frontend/revision",
    :display_name => "Application Revision",
    :description => "Revision to check out",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven_frontend::deploy_tag"],
    :default => "master"

attribute "raven_frontend/domains",
    :display_name => "Application Domains",
    :description => "Domains this vhost answers to. Comman-separated list, with first one being canonical",
    :required => "recommended",
    :type => "array",
    :recipes => ["raven_frontend::deploy_tag"],
    :default => ["raven-seo-tools.com"]

attribute "raven_frontend/gearman/worker",
    :display_name => "Start Gearman Workers",
    :description => "Indicates whether or not to start gearman workers",
    :required => "recommended",
    :choice => ["true","false"],
    :recipes => ["raven_frontend::gearman_workers"],
    :default => "false"

attribute "raven_frontend/gearman/numprocs",
    :display_name => "Number of Gearman Workers",
    :description => "Number of gearman workers to start",
    :required => "recommended",
    :type => "string",
    :default => "10",
    :recipes => ["raven_frontend::gearman_workers"]

attribute "raven_frontend/gearman/recycle_after_exec",
    :display_name => "Recycle after Exec",
    :description => "Number of jobs a worker will procsss before terminating",
    :required => "recommended",
    :type => "string",
    :default => "1",
    :recipes => ["raven_frontend::gearman_workers"]

attribute "raven_frontend/gearman/metapackage",
    :display_name => "Worker Meta-package",
    :description => "Defines the metapackage and thus the endpoints these workers will respond to.  Only applicable if start_workers=true",
    :required => "recommended",
    :type => "string",
    :default => "default",
    :recipes => ["raven_frontend::gearman_workers"]

attribute "raven_frontend/chef_registry/gearman_server",
    :display_name => "Gearman Server",
    :description => "Default gearman master server",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven_frontend:install_chef_registry"]

attribute "raven_frontend/chef_registry/sa_gearman_server",
    :display_name => "SA Gearman Server",
    :description => "Site Auditor gearman master server",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven_frontend:install_chef_registry"]

attribute "raven_frontend/chef_registry/prince_gearman_server",
    :display_name => "Prince Gearman Server",
    :description => "Prince html2pdf gearman master server",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven_frontend:install_chef_registry"]

attribute "raven_frontend/chef_registry/reports_gearman_server",
    :display_name => "Reports Gearman Server",
    :description => "Reports (dashports) gearman master server",
    :required => "recommended",
    :type => "string",
    :recipes => ["raven_frontend:install_chef_registry"]

attribute "raven_frontend/chef_registry/session_memcached_servers",
    :display_name => "Session Memcached Servers",
    :description => "Session Memcached Servers",
    :required => "recommended",
    :type => "array",
    :recipes => ["raven_frontend:install_chef_registry"]

attribute "raven_frontend/chef_registry/cache_memcached_servers",
    :display_name => "Cache Memcached Servers",
    :description => "Cache Memcached Servers",
    :required => "recommended",
    :type => "array",
    :recipes => ["raven_frontend:install_chef_registry"]

attribute "raven_frontend/chef_registry/service_layer",
    :display_name => "Service Layer",
    :description => "Service Layer",
    :required => "recommended",
    :choice => ["frontend","backend"],
    :default => "frontend",
    :recipes => ["raven_frontend:install_chef_registry"]

attribute "raven_frontend/chef_registry/server_type",
    :display_name => "Server Type",
    :description => "Server Type",
    :required => "recommended",
    :choice => ["production","testing"],
    :default => "production",
    :recipes => ["raven_frontend:install_chef_registry"]

