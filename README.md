# bis174

My server page for 4SA313. Shows server status and bots trying to log in over SSH.

## Files

- `index.html` - the page (`/var/www/html/index.html`)
- `status.sh` - writes `status.txt` and `attacks.txt` (`/usr/local/bin/status.sh`)
- `site-status.cron` - runs the script every minute (`/etc/cron.d/site-status`)

## Deploy

```bash
scp index.html status.sh site-status.cron bis:~
ssh bis 'sudo cp ~/index.html /var/www/html/ && sudo install -m 755 ~/status.sh /usr/local/bin/ && sudo cp ~/site-status.cron /etc/cron.d/site-status'
```
