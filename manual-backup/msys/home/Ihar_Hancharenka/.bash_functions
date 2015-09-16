scp-pd () {
  scp ihar.hancharenka@platform-dev:"$@"
}

scp-jlx () {
  scp hudson@192.168.31.250:"$@"
}

stack () {
  export STACK_ROOT=/d/dev/PL/Haskell/stack/.stack
  D:/dev/PL/Haskell/stack/stack.exe "$@"
}
