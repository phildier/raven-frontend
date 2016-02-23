# prepare for deployment
include_recipe "raven-deploy"

# we need php
include_recipe "raven-php"

# and we need node
include_recipe "raven-nodejs"

# install and configure supervisor
include_recipe "raven-supervisor"

# sets up chef registry
include_recipe "raven_frontend::install_chef_registry"

# install gearman libs
include_recipe "raven-gearman"

# set up gearman workers
include_recipe "raven_frontend::gearman_workers"
