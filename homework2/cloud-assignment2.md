## Task: 

1. Write a shell script that checks the disk usage in a given directory.
the script can take two optional arguments and one compulsory argument...
-d: which means that all files and directory within the specified directory or directories should be listed.
-n: which means that the top N enteries should be returned.
list of directories: this will be the directories you want to check it's disk usage
eg yourscript.sh -n 5 /var
should return the top 5 directories wrt disk usage in /var directory
yourscript.sh -d /var
should list both directories and files
Note: if -n argument is not given, it should return 8 enteries by default.

2. Create a backup script. This script creates a backup of a given directory and saves it in another directory with a timestamp. It takes two arguments: the source directory and the destination directory
Note: The backup should be a tar archive

## Solution:

### Script 1

![disk usage script](<altschl hw2 images/disk-usage-script.png>)

#!/bin/bash: This line specifies the script should be interpreted using the Bash shell.

`if [[ $1 == '-d' ]]; then:`  Checks if the first argument provided to the script is '-d'. If true, sets the variable state to true and shifts the arguments to the left. `if [[ $1 == '-n' && $2 =~ ^[0-9]+$ ]]; then:` Checks if the first argument is '-n' and the second argument is a positive integer using a regular expression. If true, sets the variable entries to the specified number and shifts the arguments accordingly.The else: If the previous condition is false, sets the variable entries to the default value of 8. Directory=$1: Assigns the first argument (after potential shifts) to the variable directory.

`if [[ $state = true ]]; then:` Checks if state is true. `sudo du -h $1 | sort -rh | head -$entries:` If state is true, it runs the disk usage command (du) with human-readable output (-h), sorts it in reverse order (sort -rh), and displays the top entries as specified by the variable entries. `else:` If state is false, it runs a similar du command but limits the depth to 1 (--max-depth=1), effectively showing the disk usage of the immediate files and directories in the specified directory.

### Result of script 1

![disk usage script result](<altschl hw2 images/Screenshot 2024-03-08 at 20.26.55.png>)


![disk usage script result](<altschl hw2 images/Screenshot 2024-03-08 at 20.28.39.png>)


![disk usage script result](<altschl hw2 images/Screenshot 2024-03-08 at 20.45.37.png>)


### Script 2

![backup script](<altschl hw2 images/Screenshot 2024-03-09 at 02.55.41.png>)

timestamp: This variable stores the precise time to uniquely identify the backup.

I created two directories (d1 & d2) and set the source and destination directories based on these directories as command-line arguments.

I set the script to create a filename by combining the timestamp with "_backup.tar.gz".

The tar command is  to create a compressed archive of the source directory and saves it to the destination directory.

### Result of script 2

![directory/file creation](<altschl hw2 images/Screenshot 2024-03-08 at 21.07.25.png>)

![result](<altschl hw2 images/Screenshot 2024-03-08 at 21.07.25.png>)

![redsult](<altschl hw2 images/result.png>)