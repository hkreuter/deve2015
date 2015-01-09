Example: my standard vm

INSTALLATION HOWTO:

- MYDIR
 - deve2015
 - PROJECTNAME
   - web
   - vmconfig
     - config
     - environments
     - modules
       Vagrantfile
   - ... other stuff

- clone deve2015 into current directory
   git clone https://github.com/hkreuter/deve2015.git

- create directory PROJECTNAME

- cwd directory PROJECTNAME

- create folder PROJECTNAME/vmconfig, copy the content  
  of deve2015/ARCHIVE/standard_vm into folder vm_config:
  cp -r deve2015/ARCHIVE/standard_vm/* vmconfig/

- inside directory PROJECTNAME/vmconfig create the following link:
  ln -s ../../deve2015/modules/ modules

- adapt Vagrantfile and environment yaml files to your needs.
  My standard_vm was made to have two virtualhosts, one for an 
  OXID eShop, the other one some playground for whatever stuff
  Create shared folders, adapt Vagrantfile, start.pp and environments 
  to you needs and then run command 'vagrant up'.
  
  WIP: need to either copy my basebox into dropbox and share the link
       or write howto create and pack your own basebox -> coming soon. 