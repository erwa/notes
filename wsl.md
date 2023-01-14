### Run Apache web server

```
sudo service apache2 start

# visit localhost in browser
```

https://medium.com/@fiqriismail/how-to-setup-apache-mysql-and-php-in-linux-subsystem-for-windows-10-e03e67afe6ee

To change the DocumentRoot, edit `/etc/apache2/sites-available/000-default.conf` and `/etc/apache2/apache2.conf`. Then `sudo service apache2 restart`.

http://mytechjournal.info/apache2-change-documentroot-folder/


### Open current directory in Explorer

```
explorer.exe .
```

https://superuser.com/questions/1338991/how-to-open-windows-explorer-from-current-working-directory-of-wsl-shell/1385493


### Windows Subsystem for Linux

This file is about Windows Subsystem for Linux (WSL).


### X server GUI support

Install VcXsrv. Then add

export DISPLAY=localhost:0.0

to your .bashrc or .bash_aliases.

https://askubuntu.com/questions/993225/whats-the-easiest-way-to-run-gui-apps-on-windows-subsystem-for-linux-as-of-2018