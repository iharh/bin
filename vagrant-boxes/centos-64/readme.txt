Add the following to the msys-bash env .bash_aliases or .bashrc:

#for NAT network mode:
alias ssh-v='ssh vagrant@127.0.0.1 -p 2222 -o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

#for BRIDGED network mode:
alias ssh-1='ssh vagrant@epbygomw0024t1.gomel.epam.com -p 22 -o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

Host Name configuration:
sudo su
echo DHCP_HOSTNAME=epbygomw0024t1.gomel.epam.com>>/etc/sysconfig/network-scripts/ifcfg-eth0

Guest Additions:
sudo /opt/VBoxGuestAdditions-<ver>/uninstall.sh

sudo mkdir /media/cdrom
sudo mount /dev/scd0 /media/cdrom

"Installing the Windows system drivers" FAILED
https://forums.virtualbox.org/viewtopic.php?f=3&t=39975

export KERN_DIR=/usr/src/kernels/`uname -r`-`uname -m`
sudo /media/cdrom/VBoxLinuxAdditions.run --nox11

check the:
/var/log/vboxadd-install.log
/var/log/vboxadd-install-x11.log


Shares:
sudo mount -t vboxsf <dev> <dir>


Add to .bashrc:
# User specific aliases and functions
alias jps='/usr/java/default/bin/jps'
alias jinfo='/usr/java/default/bin/jinfo'
alias jstack='/usr/java/default/bin/jstack'
alias ant='/opt/apache-ant-1.9.2/bin/ant'
alias svn-clean='svn st | grep "^?" | awk "{print $2}" | xargs rm -rf'


if [ -f ~/clb.bashrc ]; then
        source ~/clb.bashrc
fi

Install prerequisites:

sudo yum install man vim dos2unix
sudo yum remove svn

Install WanDisco svn client...


??? sudo yum --enablerepo=centosplus install

Kernell:
yum install kernel-devel
yum update kernel


install/upgrade java:
http://docs.oracle.com/javase/7/docs/webnotes/install/linux/linux-jdk.html

sudo rpm -ivh jdk-<ver>-linux-x64.rpm
sudo rpm -Uvh jdk-<ver>-linux-x64.rpm

uninstall java:
http://www.java.com/en/download/help/linux_uninstall.xml

rpm -qa | grep jdk
  should be something ending with *-fcs.*"
rpm -e jre-<version>-fcs

install ant:
wget http://ftp.byfly.by/pub/apache.org/ant/binaries/apache-ant-1.9.2-bin.tar.gz
sudo tar xvfz apache-ant-1.9.2-bin.tar.gz -C /opt


Vagrant commands:

vagrant up
        halt
	destroy - remove all the installed stuff
