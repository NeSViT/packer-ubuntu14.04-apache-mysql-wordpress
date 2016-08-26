
Summary: 

It's learning project where I used packer from Hashicorp. It contains packer-template that creates box based on Ubuntu 14.04 for Vagrant + VirtualBox.

Project based on https://github.com/kaorimatz/packer-templates

Project files: 

├── 14.04.log																			
├── http																			
│   ├── ubuntu																			
│   │   └── preseed.cfg																			
│   └── ubuntu-14.04																			
│       └── preseed.cfg																			
├── README.md																			
├── scripts																			
│   ├── common																			
│   │   ├── minimize.sh																			
│   │   ├── sshd.sh																			
│   │   └── vagrant.sh																			
│   └── ubuntu																			
│       ├── apt.sh																			
│       ├── cleanup.sh																			
│       ├── init.sh																			
│       ├── virtualbox.sh																			
│       └── webserver_config.sh																			
├── ubuntu-14.04-amd64.json																			
└── Vagrantfile																			

Description: 

http: contains preseeds for unattended Ubuntu 14.04 installation.

scripts: here 1 custom script that called webserver_config.sh. I added lots of comments inside. 

ubuntu-14.04-amd64.json: packer-template and it's also commented inside.

Vagrantfile: simple Vagrantfile with few lines of shell script that download wp cli to skip greating message and generate 10 posts with Lorem Ipsum text.

Key words: packer, vagrant, virtualbox, apache2, wordpress, mysql.
