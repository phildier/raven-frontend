# vim:set ft=ruby:

# cookbook dependencies for site_auditor_grid
source "https://supermarket.getchef.com"

# load local config overrides
overrides_json = File.dirname(__FILE__)+"/overrides.json"
unless File.exists?(overrides_json)
	raise "Couldn't find #{overrides_json}. See overrides.json.example"
end
config_overrides = JSON.parse(IO.read(overrides_json))

cookbook "raven_frontend", path: "raven_frontend"

cookbook "yum"

puts config_overrides

if config_overrides.has_key?('cookbook_dev_dir') and not config_overrides['cookbook_dev_dir'].nil? then
	# use local development cookbooks
	cookbook "raven-php", path: "/development/raven-php"
	cookbook "raven-deploy", path: "/development/raven-deploy"
	cookbook "raven-supervisor", path: "/development/raven-supervisor"
	cookbook "potg-app", path: "/development/potg-app"
	cookbook "raven-dev", path: "/development/raven-dev"
	cookbook "raven-db", path: "/development/raven-db"
	cookbook "raven-nodejs", path: "/development/raven-nodejs"
	cookbook "raven-redis", path: "/development/raven-redis"
	cookbook "raven-gearman", path: "/development/raven-gearman"
	cookbook "site_auditor_grid", path: "/development/site_auditor_grid/site_auditor_grid"
else 
	# use cookbooks from git
	cookbook "raven-php", git: "https://github.com/raventools/raven-php.git"
	cookbook "raven-deploy", git: "https://github.com/raventools/raven-deploy.git"
	cookbook "raven-supervisor", git: "https://github.com/raventools/raven-supervisor.git"
	cookbook "potg-app", git: "https://github.com/raventools/potg-app.git"
	cookbook "raven-dev", git: "https://github.com/raventools/raven-dev.git"
	cookbook "raven-db", git: "https://github.com/raventools/raven-db.git"
	cookbook "raven-nodejs", git: "https://github.com/raventools/raven-nodejs.git"
	cookbook "raven-redis", git: "https://github.com/raventools/raven-redis.git"
	cookbook "raven-gearman", git: "https://github.com/raventools/raven-gearman.git"
	cookbook "site_auditor_grid", 
		git: "git@github-site_auditor_grid:raventools/site_auditor_grid.git",
		rel: "site_auditor_grid"
end
