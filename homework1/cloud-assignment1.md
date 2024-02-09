# Homework 1
I created the user Hakeem with a home directory /home/Hakeem using the `useradd` command with the `m` flag (helps to automatically create the home direcctory), and then using the `mkdir` command, I created the directories: 
* code
* tests
* personal
* misc

![command for user creation](<altschl hw1 images/User.png>)

1. I navigated to the tests directory using absolute pathname

    ![Absolute path navigation](<altschl hw1 images/AbsolutePath.png>)

2. I navigated to the tests directory using relative pathname

    ![Relative path navigation](<altschl hw1 images/Relativepath.png>)

3. I used echo command to create a file named fileA with text content ‘Hello A’ in the misc directory.

    ![Echo command](<altschl hw1 images/EchoFileA.png>)

4. I created a file named fileB in the misc directory using the `touch` command. Then I added dummy content to the file using the `nano` text editor.

    ![touch command](<altschl hw1 images/fileB.png>)

    ![nano command](<altschl hw1 images/NanoFileB.png>)

    ![fileB content](<altschl hw1 images/ContentFileB.png>)

5. I copied contents of fileA into fileC using `cp` command.

    ![cp command](<altschl hw1 images/copyFileA.png>)

6. I moved contents of fileB into fileD using `mv` command.

    ![move command](<altschl hw1 images/MoveFileB.png>)

7. I created a tar archive called misc.tar for the contents of misc directory using the `tar` command and `c`,`v`,`f` flags.

    ![tar archive](<altschl hw1 images/TarArchive.png>)

8. I compressed the tar archive to create a misc.tar.gz file using the `gzip` command.

    ![gzip command](<altschl hw1 images/CompressTarArchive.png>)

9. I tried creating a user using the `useradd` command but was not able to. I realised that my user `Hakeem` whose home dirctory I was making my commands from had to be a member of `sudoers` group to be able to create a user. So I exited the user and added the user to sudoers using usermod command with a and G flags. 

    After that I logged back into my user `Hakeem`'s home directory and was able to create a new user with the `useradd` command. I gave the user a password using the `sudo passwd` command. After setting the password, I forced the user to change password upon login by running the `sudo passwd` command again,but with an `--expire` option.

    ![add user to sudoers](<altschl hw1 images/AddUserToSudo.png>)

    ![force password change](<altschl hw1 images/ForcePasswordChange.png>)

10. I locked a user's password using the `sudo passwd` command with the `l` flag. I tried to login to the user and got 'Authentication failure' error. I also realised that when the password is locked, an exclamation mark `I` was added in front of the password hash when I viewed the `/etc/passwd` file using the `cat` & `grep` commands.

    To be sure, I unlocked the password with the `sudo passwd` command and `u` flag. then I checked the `/etc/passwd` file to confirm the exclamation mark `I` was removed. I was able to login to the user after unlocking.

    ![locking user password](<altschl hw1 images/LockUserPassword.png>)

    ![locking user password](<altschl hw1 images/LockUnlockUserPassword.png>)

11. I created a user with no login shell using the `useradd`command and the `-s` flag to specify the no login shell (`/sbin/nologin`).

    ![User with no login shell](<altschl hw1 images/NoLoginShellUser.png>)

12. I disabled password based authentication for ssh by editing the ssh configuration file located in `/etc.ssh/sshd_config` using the `nano` text editor. I tested password authention when set to yes and no and have attached the results in the images below.

    * Password Authentication Enabled

        ![password authentication enabled](<altschl hw1 images/EditPasswordAuthentication.png>)

        ![password authentication enabled](<altschl hw1 images/PasswordAuthenticationEnabled.png>)

    * Password Authentication Disabled

        ![password authentication disabled](<altschl hw1 images/DisablePasswordAuthentication.png>)

        ![password authentication enabled](<altschl hw1 images/PasswordAuthenticationDisabled.png>)

13. I disabled root login by editing the shell of the root user using the `nano` text editor. I changed the shell of the root user to `/sbin/nologin`, making root a user with a no login shell, thus, disabling root login.

    ![disable root login](<altschl hw1 images/DisableRootLogin1.png>)

    ![disable root login](<altschl hw1 images/DisableRootLogin2.png>)

    ![disable root login](<altschl hw1 images/DisableRootLogin3.png>)

__*All commands were run from home directory `/home/Hakeem` of the user `Hakeem`.*__
