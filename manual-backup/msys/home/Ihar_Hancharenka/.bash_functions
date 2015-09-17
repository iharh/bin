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
