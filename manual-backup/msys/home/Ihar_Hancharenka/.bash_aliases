set -o vi

alias ssh-1='ssh vagrant@epbygomw0024t1.gomel.epam.com -p 22 -o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

# \e - escape seq - \033
# \u - user
# \h - host
# \w - the current working directory, with $HOME abbreviated with a tilde
# \W - the basename of the current working directory, with $HOME abbreviated with a tilde 
# \n - new line
# \r - carriage return
# \l - the basename of the shells terminal device name 
# \\ - a backslash
# \[ - begin a sequence of non-printing characters, which could be used to embed a terminal control sequence into the prompt
# \] - end a sequence of non-printing characters

export PS1='\[\e[00;32m\]\u\[\e[00;34m\]::\[\e[00;31m\]\h \[\e[00;34m\]{ \[\e[00;34m\]\w \[\e[00;34m\]}\[\e[00;32m\]-> \[\e[00m\]'
#'\[\e[00;32m\]\u\[\e[00;34m\]::\[\e[00;31m\]\h \[\e[00;34m\]{ \[\e[00;34m\]\w \[\e[00;34m\]}\[\e[00;32m\]-> \[\e[00m\]'
#export PS1='\[\e]0;$MSYSTEM:\w\007\n\e[32m\]\u@\h \[\e[33m\w$(__git_ps1)\e[0m\]\n# '
if [ -f /usr/share/git/completion/git-completion.bash ]; then
  export GIT_PS1_SHOWDIRTYSTATE=true
  source /usr/share/git/completion/git-completion.bash
  source /usr/share/git/completion/git-prompt.sh
  #export PS1='\[\e[01;32m\]\u\[\e[01;34m\]::\[\e[01;31m\]\h \[\e[00;34m\]{ \[\e[01;34m\]\w\[\e[00;34m\]$(__git_ps1) }\[\e[01;32m\]-> \[\e[00m\]'
fi

alias lsc='ls --color=yes'
alias la='ls -la --color=yes'

#> dircolors -sh ~/.dircolors > out.sh
export LS_COLORS='no=00;38;5;244:di=00;38;5;33:ln=01;38;5;37:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=01;38;5;64:*.tar=00;38;5;61:*.tgz=01;38;5;61:*.arj=01;38;5;61:*.taz=01;38;5;61:*.lzh=01;38;5;61:*.lzma=01;38;5;61:*.tlz=01;38;5;61:*.txz=01;38;5;61:*.zip=01;38;5;61:*.z=01;38;5;61:*.Z=01;38;5;61:*.dz=01;38;5;61:*.gz=01;38;5;61:*.lz=01;38;5;61:*.xz=01;38;5;61:*.bz2=01;38;5;61:*.bz=01;38;5;61:*.tbz=01;38;5;61:*.tbz2=01;38;5;61:*.tz=01;38;5;61:*.deb=01;38;5;61:*.rpm=01;38;5;61:*.jar=01;38;5;61:*.rar=01;38;5;61:*.ace=01;38;5;61:*.zoo=01;38;5;61:*.cpio=01;38;5;61:*.7z=01;38;5;61:*.rz=01;38;5;61:*.apk=01;38;5;61:*.gem=01;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=01;38;5;245:*.rdf=01;38;5;245:*.owl=01;38;5;245:*.n3=01;38;5;245:*.ttl=01;38;5;245:*.nt=01;38;5;245:*.torrent=01;38;5;245:*.xml=01;38;5;245:*Makefile=01;38;5;245:*Rakefile=01;38;5;245:*build.xml=01;38;5;245:*rc=01;38;5;245:*1=01;38;5;245:*.nfo=01;38;5;245:*README=01;38;5;245:*README.txt=01;38;5;245:*readme.txt=01;38;5;245:*.md=01;38;5;245:*README.markdown=01;38;5;245:*.ini=01;38;5;245:*.yml=01;38;5;245:*.cfg=01;38;5;245:*.conf=01;38;5;245:*.c=01;38;5;245:*.cpp=01;38;5;245:*.cc=01;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=01;38;5;166:*.mpg=01;38;5;166:*.mpeg=01;38;5;166:*.m2v=01;38;5;166:*.mkv=01;38;5;166:*.ogm=01;38;5;166:*.mp4=01;38;5;166:*.m4v=01;38;5;166:*.mp4v=01;38;5;166:*.vob=01;38;5;166:*.qt=01;38;5;166:*.nuv=01;38;5;166:*.wmv=01;38;5;166:*.asf=01;38;5;166:*.rm=01;38;5;166:*.rmvb=01;38;5;166:*.flc=01;38;5;166:*.avi=01;38;5;166:*.fli=01;38;5;166:*.flv=01;38;5;166:*.gl=01;38;5;166:*.m2ts=01;38;5;166:*.divx=01;38;5;166:*.webm=01;38;5;166:*.axv=01;38;5;166:*.anx=01;38;5;166:*.ogv=01;38;5;166:*.ogx=01;38;5;166:';

#other
#alias please='sudo $(fc -ln -1)'

# ssh stuff (ssh-copy-id)

alias ssh-cps1='ssh ihar.hancharenka@d9-z01-lvpn-01.clarabridge.net'
alias ssh-pd='ssh ihar.hancharenka@platform-dev'
alias ssh-jlx='ssh hudson@192.168.31.250'
alias ssh-basil1='ssh anton.aharkau@basil1 -p 22'

#-o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

alias ssh-1='ssh vagrant@epbygomw0024t1.gomel.epam.com -p 22 -o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

alias ssh-2='ssh vagrant@epbygomw0024t2.gomel.epam.com -p 22 -o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

alias ssh-2r='ssh root@epbygomw0024t2.gomel.epam.com -p 22 -o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

alias ssh-v='ssh vagrant@127.0.0.1 -p 2222 -o LogLevel=FATAL -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i /d/dev/Utils/Virtualization/Vagrant/insecure_private_key'

# d2m stuff
alias ssh-d2m='docker-machine -s "D:\vbox-dm" ssh d2m'
alias d2m-start='docker-machine -s "D:\vbox-dm" start d2m'
alias d2m-stop='docker-machine -s "D:\vbox-dm" stop d2m'
alias d2m-ip='docker-machine -s "D:\vbox-dm" ip d2m'
alias d2m-config='docker-machine -s "D:\vbox-dm" config d2m'
alias d2m-inspect='docker-machine -s "D:\vbox-dm" inspect d2m'
alias d2m-status='docker-machine -s "D:\vbox-dm" status d2m'
alias d2m-url='docker-machine -s "D:\vbox-dm" url d2m'
alias d2m-env='docker-machine -s "D:\vbox-dm" env d2m'
#scp, upgrade

