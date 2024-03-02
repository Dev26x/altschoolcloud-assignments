# Package installation from a repository

Task:

Install PHP 7.4 on your local linux machine using the ppa:ondrej/php package repo.
Instruction:

Learn how to use the add-apt-repository command
Submit the content of /etc/apt/sources.list and the output of php -v command.

## Solution
In order to install php7.4 on my linux machine, I carried out the following steps:

1. I checked if php was already installed on my machine by running the `php -v` command.
![php version check](images/version-check.png)

2. Since php was not installed on my computer, I proceeded by updating my existing packages with the `apt-get update` command.
![updating packages](images/first-apt-update.png)

3. Once the update was complete, I proceeded to add the **ppa:ondrej/php** using the `add-apt-repository ppa:ondrej/php` command.
![adding repository](images/add-repository.png) 

4. Then I updated my package repository again, this time using just the `apt update` command, because I realised the `apt-get` and `apt` do the same package management function.
![package update](images/second-apt-update.png)

5. After adding the repository, I proceeded to install php 7.4 by running `apt-get install php7.4` command.
![installing php](images/install-php.png)

6. Once the installation was complete, I ran tht `php -v` command to confirm that php7.4 was installed on my machine. The version was displayed, showing that php7.4 was installed on my machine.
![php version check](images/version-check-2.png)


### Content of /etc/apt/sources.list

![content of sources.list](images/sources-list1.png)

![content of sources.list](images/sources-list2.png)

### Output of php -v command

![output of php -v command](images/version-check-2.png)