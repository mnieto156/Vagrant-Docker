# -*- mode: ruby -*-
# vi: set ft=ruby :
host_vagrantfile="./host/Vagrantfile"
Vagrant.configure(2) do |config|
=begin
  config.vm.define "app" do |app|
    app.vm.provider "docker" do |docker|
      docker.image = "debian"
      docker.name  = "app"
      docker.volumes = ["/var/www:/var/www,/opt/data/sql:/var/lib/postgresql/data"]
      docker.vagrant_vagrantfile = host_vagrantfile
      docker.remains_running = false
    end
  end
=end
  config.vm.define "nginx" do |v|
    v.vm.provider "docker" do |d|
	    d.force_host_vm = true
      d.image   = "nginx"
      d.ports   = ["80:80"]
      d.name    = "nginx"
	    #d.create_args = ["--volumes-from=app"]
      d.vagrant_vagrantfile = host_vagrantfile
    end
  end
=begin  
  config.vm.define "postgres" do |v|
    v.vm.provider "docker" do |d|
  	  d.image	= "postgres"
  	  d.name	= "postgres"
  	  d.ports	= ["5432:5432"]
  	  d.create_args = ["--volumes-from=app"]
      d.vagrant_vagrantfile = host_vagrantfile
	  end
  end
=end
end