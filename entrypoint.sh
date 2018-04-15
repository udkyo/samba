#!/bin/sh

user=${user:-user}
pass=${pass:-password}

adduser -D -s /sbin/nologin ${user}

(echo ${pass}; echo ${pass}) | smbpasswd -a -s ${user}

[ "$user" = "user" ] && [ "$pass" = "password" ] \
  && cat <<EOF > /etc/samba/smb.conf
  writeable = yes
  browseable = yes
  public = yes
  force user = user
EOF

exec /usr/sbin/smbd -F -S
