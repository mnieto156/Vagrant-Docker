# -*- mode: ruby -*-
# vi: set ft=ruby :
host_vagrantfile="./host/Vagrantfile"
Vagrant.configure(2) do |config|

  config.vm.define "app" do |app|
    app.vm.provider "docker" do |docker|
      docker.image = "debian"
      docker.name  = "app"
      docker.volumes = ["/var/www:/var/www,volumes/data/sql:/var/lib/postgresql/data"]
      docker.vagrant_vagrantfile = host_vagrantfile
      docker.remains_running = false
    end
  end
  config.vm.define "nginx" do |v|
    v.vm.provider "docker" do |d|
	  d.force_host_vm = true
      d.image   = "nginx"
      d.ports   = ["80:80"]
      d.name    = "nginx"
	  d.create_args = ["--volumes-from=app"]
      d.vagrant_vagrantfile = host_vagrantfile
    end
  end
  
  config.vm.define "postgresql" do |v|
    v.vm.provider "docker" do |d|
	  d.image	= "postgresql"
	  d.name	= "postgresql"
	  d.ports	= ["5432:5432"]
	  d.create_args = ["--volumes-from=app"]
      d.vagrant_vagrantfile = host_vagrantfile
	end
  end
end