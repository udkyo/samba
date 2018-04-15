#!/bin/sh

user=${user:-user}
pass=${pass:-password}

adduser -D -s /sbin/nologin ${user}

[ "$user" = "user" ] && [ "$pass" = "password" ] \
&& tee -a /etc/samba/smb.conf <<EOF >/dev/null \
&& smbpasswd -a -n ${user} \
|| (echo ${pass}; echo ${pass}) | smbpasswd -a -s ${user}
   guest ok = yes
   public = yes
   force user = user
EOF

exec /usr/sbin/smbd -F -S
