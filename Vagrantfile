# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Turn on ssh x11 forwarding to true
  config.ssh.forward_x11 = "true"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 1
  end

  config.vm.define "sonarqube" do |v|
    v.vm.provision :shell, :path => "bootstrap_sq.sh"
    v.vm.box = "unicorn64"
    v.vm.hostname = "sonar"

    v.vm.provider "virtualbox" do |vb|
      vb.customize [
                    "modifyvm", :id,
                    "--memory", "2048",
                    "--cpus", "2"
                   ]
    end
  end


end
