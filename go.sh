#!/usr/bin/env bash

# Default to https://github.com/danieljurek/dev-environment-setup if no environment specified
declare site_root=${1:-https://raw.githubusercontent.com/danieljurek/dev-environment-setup/master}

echo "Downloading from $site_root" 


# TODO: Make this a list
curl $site_root/Vagrantfile			> Vagrantfile
curl $site_root/bootstrap.sh		> bootstrap.sh
curl $site_root/install-rvm.sh		> install-rvm.sh
curl $site_root/install-ruby.sh 	> install-ruby.sh 
curl $site_root/finalize.sh 		> finalize.sh 

vagrant up 

# Clean up after ourselves (leave Vagrantfile behind for later tweaking)

if [ $? -eq 0 ]; then
	# TODO: Add .vagrant, Vagrantfile, and friends to .gitignore 

    echo All went well... cleaning up 
    # rm bootstrap.sh install-rvm.sh install-ruby.sh 
else
    echo There was an error... 
fi

