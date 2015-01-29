# dev-environment-setup

To set up a Vagrant box for your folder, cd to the folder and run the command:  
`$ \curl https://raw.githubusercontent.com/danieljurek/dev-environment-setup/master/go.sh | bash -s`

*This will set up a Vagrant instance in the directroy where run*

Once the process completes you can access the box via ssh
`$ vagrant ssh` 

To launch a Rails project, go to the /vagrant folder on your VM and launch Rails
```
cd /vagrant 
rake db:setup   // Optional depending on whether the machine is fresh or not 
rails s```

*In case of error*
If the command reports an error you can edit the Vagrantfile with new port mappings and the continue the setup process by running the command:  
`$ vagrant up`


**Caution** 
The Vagrantfile currently forwards ports to the local machine. Therefore, **you may only have one instance of Vagrant running under this configuration at a time.** If you want to run multiple machines simultaneously, this is fine, just edit the port mapping of the Vagrantfile for the machine you wish to configure.  
```
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 3306, host: 3307 
```



