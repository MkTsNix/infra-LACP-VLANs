# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
:inetRouter => {
        :box_name => "centos/7",
        :net => [
                   {adapter: 2, auto_config: false, virtualbox__intnet: "inet-network"},
                   {adapter: 3, auto_config: false, virtualbox__intnet: "inet-network"}
                ]
  },
  :centralRouter => {
        :box_name => "centos/7",
        :net => [
                   {adapter: 2, auto_config: false, virtualbox__intnet: "inet-network"},
                   {adapter: 3, auto_config: false, virtualbox__intnet: "inet-network"},
                   {adapter: 4, auto_config: false, virtualbox__intnet: "office1"},
                ]
  },
  :testServer1 => {
    :box_name => "centos/7",
    :net => [
                  {adapter: 2, auto_config: false, virtualbox__intnet: "office1"},
                ]
  },
  :testServer2 => {
    :box_name => "centos/7",
    :net => [
                  {adapter: 2, auto_config: false, virtualbox__intnet: "office1"},
            ]
  },
  :testClient1 => {
    :box_name => "centos/7",
    :net => [
                  {adapter: 2, auto_config: false, virtualbox__intnet: "office1"},
            ]
  },
  :testClient2 => {
    :box_name => "centos/7",
    :net => [
                  {adapter: 2, auto_config: false, virtualbox__intnet: "office1"},
            ]
},

}

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|
    config.vm.define boxname do |box|


        box.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s

        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end

        if boxconfig.key?(:public)
          box.vm.network "public_network", boxconfig[:public]
        end

        box.vm.provision "shell", inline: <<-SHELL
          mkdir -p ~root/.ssh
                cp ~vagrant/.ssh/auth* ~root/.ssh
        SHELL



#     config.vm.provision "ansible" do |ansible|
#     ansible.verbose = "v"
#     ansible.playbook = "playbooks/prep_stand_LACP_VLANs.yml"
#    end

  end
end
end