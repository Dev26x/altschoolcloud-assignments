# Setting up Ubuntu 20.04 LTS on Local machine using vagrant

![exercise tasks](<images/Screenshot 2024-02-27 at 11.04.49.png>)

After installing Vagrant and Virtualbox on my macbook, I created a folder/directory for my vagrant instance.
In my terminal, I ran the following commands:

`vagrant init ubuntu/focal64` -
This command initialises the vagrant and creates a file containing configurations called Vagrantfile, where ubuntu/focal64 is the vagrant box name for Ubuntu 20.04 LTS.

`vagrant up` -
This command sets up the virtual machine based on the configuration defined in the Vagrantfile.

`vagrant ssh` -
This command enables user log in to the virtual machine managed by Vagrant using SSH (Secure Shell).

## Customize Vagrantfile as necessary, with private_network set to dhcp

I navigated to the folder containing the Vagantfile and edited it using nano editor.

![navigating to folder containing Vagrantfile](<images/Screenshot 2024-02-27 at 11.10.11.png>)

![editing Vagrantfile with nano](<images/Screenshot 2024-02-27 at 11.08.59.png>)

I saved the configuration I made to the Vagrantfile, then I ran the `ifconfig` command.

![ifconfig command result](<images/Screenshot 2024-02-27 at 11.11.18.png>)

This shows my private network interface was configured to ensure that the virtual machine automatically obtained IP address, subnet mask, default gateway, and other network configuration settings.
