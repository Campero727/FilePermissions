# File Permissions
## _The Last Markdown Editor, Ever_

[![GitHub top language](https://img.shields.io/github/languages/top/Campero727/WhichSystem?logo=ruby&style=flat-square)](#)
[![GitHub repo size](https://img.shields.io/github/repo-size/Campero727/WhichSystem?logo=webpack&style=flat-square)](#)
[![By](https://img.shields.io/badge/By-Campero727-green?style=flat-square&logo=github)](#)
----


The Ruby tool we present is a valuable aid in the post-exploitation phase in Linux environments. Its main function is to search for files with permissions set to 777, SUID permissions, or execution permissions where the owner is root. These files can be critical in the privilege escalation process, as their careful manipulation can allow for gaining access as the superuser (root) in the compromised system.

## Features

- Efficiently searches for files with specific permissions and owner conditions.
- Identifies files with permissions set to 777, SUID, or execution owned by the root user.
- Identifies files with permissions set to 777, SUID, or execution owned by the root user.
- Easy to use and customize for different scenarios.

## Usage Instructions:

Clone the repository to your local machine.

```sh
git clone <repository>
```
Ensure you have Ruby and the "etc" and "file" gem installed in your environment, or install the gem.

```sh
gem install etc
gem install file
```

Execute the script using Ruby.

```sh
ruby FilePermissions.rb <Path>
```

Note: It is recommended to set the root directory (\\) as the Path since this way it will find a greater number of binaries or useful files for privilege escalation.

# Manual Method
If you are performing the process manually, you should execute the following commands.
```sh
cd \
find \ -perm -4000 --user root 2>/dev/null
find . \
ls -l | grep "^-rwxrwxrwx"
```
Among others. This tool automates everything, without the need to change directories.

