scp-from-pd () {
  scp ihar.hancharenka@platform-dev:"$@"
}
scp-to-pd () {
  scp "$@" ihar.hancharenka@platform-dev:/home/ihar.hancharenka/
}

scp-jlx () {
  scp hudson@192.168.31.250:"$@"
}

stack () {
  export STACK_ROOT=/d/dev/PL/Haskell/stack/.stack
  #echo $STACK_ROOT
  D:/dev/PL/Haskell/stack/stack.exe "$@"
  unset STACK_ROOT
}

d2m-env-export() {
  export DOCKER_TLS_VERIFY="1"
  export DOCKER_HOST="tcp://192.168.99.100:2376"
  export DOCKER_CERT_PATH="D:\vbox-dm\machines\d2m"
  export DOCKER_MACHINE_NAME="d2m"
}
