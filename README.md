# samba
Simple samba sharing via docker

Run it with -t, port 445 forwarded, and the folder you want to share mounted at /shared. Optionally, include *user* and *pass* env vars t specify login credentials:

`docker run --rm -d -t -p 445:445 -e user=foo -e pass=bar -v /your/local/path:/shared udkyo/smb`

You'll then be able to connect to smb://x.x.x.x/shared

If no username and password are provided, no username and password will be required to connect.
