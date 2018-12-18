# -*- mode: ruby -*-
# vi: set ft=ruby :
HOST_VAGRANTFILE="./host/Vagrantfile"
Vagrant.configure(2) do |config|

  config.vm.define "app" do |app|
    app.vm.provider "docker" do |d|
      d.force_host_vm = true
      d.image = "debian"
      d.name  = "app"
      d.volumes = [ "/var/www:/var/www",
                    "/opt/data/nginx:/etc/nginx",
                    "/opt/data/sql:/var/lib/postgresql/data",
                    "/opt/data/gitea:/opt/data/gitea"
                  ]
      d.vagrant_vagrantfile = "#{HOST_VAGRANTFILE}"
      #d.remains_running = false
    end
  end


  
  config.vm.define "postgres" do |v|
    v.vm.provider "docker" do |d|
      d.force_host_vm = true
      d.image	= "postgres:9.6"
      d.name	= "postgres"
      d.ports	= ["5432:5432"]
      d.env = {
        :POSTGRES_USER      => "gitea",
        :POSTGRES_PASSWORD  => "gitea",
        :POSTGRES_DB        => "gitea"
      }
      d.create_args = ["--volumes-from=app"]
      d.vagrant_vagrantfile = "#{HOST_VAGRANTFILE}"
    end
  end

    config.vm.define "gitea" do |v|
    v.vm.provider "docker" do |d|
      d.force_host_vm = true
      d.image = "gitea/gitea:latest"
      d.name  = "gitea"
      d.ports = ["3000:3000","2222:22"]
      d.env = {
        :USER_UID => 1000,
        :USER_GID => 1000,
        :DB_TYPE => "postgres",
        :DB_HOST => "postgres:5432",
        :DB_NAME => "gitea",
        :DB_USER => "gitea",
        :DB_PASSWD => "gitea"
      }
      d.volumes = ["/data:/opt/data/gitea"]
      d.link "postgres:postgres"
      d.vagrant_vagrantfile = "#{HOST_VAGRANTFILE}"
    end
  end

  config.vm.define "nginx" do |v|
    v.vm.provider "docker" do |d|
      d.force_host_vm = true
      d.image   = "nginx"
      d.ports   = ["80:80","433:433"]
      d.name    = "nginx"
      d.link "gitea:gitea"
      d.create_args = ["--volumes-from=app"]
      d.vagrant_vagrantfile = "#{HOST_VAGRANTFILE}"
    end
  end
  
end