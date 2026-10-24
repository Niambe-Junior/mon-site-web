Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "devops-lab"

  # Adresse IP privee imposee par le TP
  config.vm.network "private_network", ip: "192.168.10.30"

  # Partage de fichiers entre Windows et Ubuntu
  config.vm.synced_folder "./site", "/home/vagrant/site", create: true

  # Ressources de la machine virtuelle
  config.vm.provider "virtualbox" do |vb|
    vb.name = "devops-lab"
    vb.memory = 3072
    vb.cpus = 2
  end

  # Installation automatique de Docker
  config.vm.provision "shell", path: "install-docker.sh"
end