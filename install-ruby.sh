 #!/usr/bin/env bash

# TODO: Consolidate this 

 source /usr/local/rvm/scripts/rvm

 rvm use --install $1

 shift

 if (( $# ))
 then gem install $@
 fi