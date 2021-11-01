# admin-helper

## What is admin-helper?
It's very simple list of commands, which are used to check daily, what is happening on your server.

At the moment, it supports servers that are based on Debian.

## What commands does it have?
last, journalctl, systemctl, netstat, fail2ban-client, apt update

## How to install?
Copy the script directly from GitHub to your home directory, using the command:\
__git clone https://github.com/mattrattus/admin-helper.git__

And then, in the downloaded directory, change the execute permissions of the file:\
__chmod +x admin.sh__

## Using
Enter the directory, and then run the script manually, using the command:\
__./admin.sh__

## License
admin-helper is released under the [MIT license](LICENSE).