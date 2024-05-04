This is a simple backup of my configs for the Guix System.  As I learn more about Guix, this will change and probably become closer to ideal.  Right now it is just an experiment, as I worked with NixOS prior.

**apply-globalconfig.sh**- applies the standard global configuration apply command

**apply-homeconfig.sh** - applies the guix home reconfigure command (useful when you make adjustments to it)

**duplicate-configs.sh**- for now a simple way to make easy copies of other config files for guix to backup to git until a more elegant solution is found

**update-system.sh**- applys the pull and then upgrade command to update the packages.
