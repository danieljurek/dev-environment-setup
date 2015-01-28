# dev-environment-setup

Download `Vagrantfile`, `install-ruby.sh`, `install-rvm.sh`, and `bootstrap.sh` to the place where you want to create your Vagrant box (usually in your repo or maybe one folder level up)

Now make sure that you have a line like this uncommented in your `Vagrantfile` file (this opens ports on the vagrant machine to your local computing session)
`config.vm.network "forwarded_port", guest: 3000, host: 3000`

You may need to set up port mappings for every instance of every site that could be run if you plan to develop on multiple sites simultaneously. 

Install the Chef plugin for vagrant (only need to run this once)
`$ vagrant plugin install vagrant-librarian-chef`

Next, bring up the box using the below command. This will launch Vagrant, download the appropriate packages, and set up a brand new machine (unless one is already present, then it will just boot that machine) 
`$ vagrant up`

Now go into the box using ssh 
`$ vagrant ssh` 

To launch a Rails project, go to the /vagrant folder on your VM and launch Rails
```
cd /vagrant 
rake db:setup   // Optional depending on whether the machine is fresh or not 
rails s```
