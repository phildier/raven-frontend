if node[:raven_frontend][:gearman][:worker].to_s == "true" then

	recycle = node[:raven_frontend][:gearman][:recycle_after_exec].to_i
 	metapackage = node[:raven_frontend][:gearman][:metapackage]
	cmd = "php gearman_worker.php gearman gearman_worker acceptRequests fkd932Fa352GDFJx21s7124 #{recycle} #{metapackage}"
	dir = "#{node[:raven_frontend][:app_path]}/current/codeigniter/applications/raven/includes/gearman"

	raven_supervisor_program "gearman_worker" do
		command cmd
		directory dir
		user "apache"
		numprocs node[:raven_frontend][:gearman][:numprocs]
		exitcodes [111]
		autorestart "unexpected"
		create_dir false
	end
end
