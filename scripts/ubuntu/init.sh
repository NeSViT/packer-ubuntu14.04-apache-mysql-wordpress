#!/bin/bash

echo "START INIT.SH SCRITP"
set -x

echo "SUDO SED"
sudo sed -i -e 's,^\(ACTIVE_CONSOLES="/dev/tty\).*,\11",' /etc/default/console-setup

echo "LOOP"
for f in /etc/init/tty[^1]*.conf; do
  sudo mv "$f"{,.bak}
done
