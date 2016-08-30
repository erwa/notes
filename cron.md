### Syntax explained
https://en.wikipedia.org/wiki/Cron
```
 # ┌───────────── min (0 - 59)
 # │ ┌────────────── hour (0 - 23)
 # │ │ ┌─────────────── day of month (1 - 31)
 # │ │ │ ┌──────────────── month (1 - 12)
 # │ │ │ │ ┌───────────────── day of week (0 - 6) (0 to 6 are Sunday to
 # │ │ │ │ │                  Saturday, or use names; 7 is also Sunday)
 # │ │ │ │ │
 # │ │ │ │ │
 # * * * * *  command to execute
```

Examples:
```
# @hourly at beginning of hour
0 * * * *

# @yearly at midnight on Jan. 1
0 0 1 1 *
```

You can think of `*` as meaning all values.


### Schedule a cron job
```bash
crontab -e
```
See http://www.cyberciti.biz/faq/how-do-i-add-jobs-to-cron-under-linux-or-unix-oses/. The crontab is stored in `/var/spool/cron/`, but is not meant to be edited by hand. See http://askubuntu.com/questions/216692/where-is-the-user-crontab-stored. To see recent cron job runs, run:
```bash
grep <script_name> /var/log/cron
```