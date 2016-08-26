Vagrant.configure("2") do |config|

  config.vm.box = "vagrant-ubuntu-14.04virtualbox.box"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision "shell", inline: <<-SHELL
  	  echo "INSTALL WP-CLI PACKET FOR RULING WORDPRESS FROM CONSOLE"
      # Download wp-cli
      curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
      # set execute permissions to downloaded file
      chmod +x wp-cli.phar
      # move file to custom derectory
      sudo mv wp-cli.phar /usr/local/bin/wp
      # delete downloaded file
      rm -f wp-cli.phar

      echo "CONFIGURE INSTALL.PHP PAGE AUTOMATICALLY"
      # run command from user vagrant to configure wordpress start page 
      sudo -u vagrant -i -- wp core install --path="/var/www/WordPress" --url=192.168.33.10 --title="DEVOPS START" --admin_user=nesvits --admin_password=password --admin_email=nesvits@gmail.com
      sudo -u vagrant -i -- curl http://loripsum.net/api/5 | sudo -u vagrant -i -- wp post generate --path="/var/www/WordPress" --post_content --count=10

      echo "RESTART APACHE2 SERVICE"
      service apache2 restart
   SHELL
end
