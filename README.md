# next-BackupSites

A simple tool for dumping data from webservers like website directory and mysql database, using scp, mysqldump, ssh.

## How to use

Before running the backup.sh give the user privileges to execute the script.

```
chmod u+x ./backup.sh
```

Now, let's run the code, where <path_to_page_list> is comma separated list of websites, users etc.
You can choose a single site to dump from the list with setting the <one_domain> argument.

```
./backup.sh <path_to_page_list> [<one_domain>]
```

## page_list columns
name,IP|domain,user,mysqluser,mysqlpassword,folder

- name can be whatever you want. It is compared with the <one_domain> parameter.
- domain or IP address
- user on the server that will be used to log into the server
- mysqluser
- mysqlpassword
- folder that will be recursively copied
### Example of page_list
Google,google.com,root,

If you do not want to type every single password for each server in your list, make sure that you have added your private key to .ssh/authorized_keys on each server.

You can use teh script addkeys.sh to add your key on each site.
```
./addkeys.sh <user> <ip|domainname>
```
