# prepare for deployment
include_recipe "raven-deploy"

# sets up chef registry
include_recipe "raven_frontend::install_chef_registry"

# install gearman libs
include_recipe "raven-gearman"

# set up gearman workers
include_recipe "raven_frontend::gearman_workers"
