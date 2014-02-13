import complete.DefaultParsers._
//import complete.Parser._

lazy val dstPath = settingKey[String]("Dst path")
lazy val copydf = taskKey[Unit]("Dotfiles copy task")
lazy val e1 = taskKey[Unit]("Echo some staff task")
lazy val i1 = inputKey[Unit]("Some input task")

val argParser = OptSpace ~> token(StringBasic, "<arg>") // = spaceDelimited("<arg>")
// StringBasic.examples("<arg>") // : Parser[String]

dstPath := "D:\\dev\\bin\\dotfiles"

copydf := {
    val dst = file(dstPath.value)
    IO.delete(dst)
    IO.createDirectory(dst)
    // IO.copy(...).get map {f => (f, dst / f.getName)})
    val home = Path.userHome
    val vimfiles = home / "vimfiles"
    val filesToCopy = (
        (
	    (vimfiles ***)
	    --- (vimfiles / "bundle" ***)
	    --- (vimfiles ** ".*")
	)
        +++ (home * "_*rc")
    )
    val rebasedFilesToCopy = filesToCopy pair Path.rebase(home, dst)
    // rebasedFilesToCopy foreach {tup => println(tup._2) }
    IO.copy(rebasedFilesToCopy)
} 

e1 := {
    println("aaa")
}

// sbt i1"abc"
// sbt i1"""abc  def"""
// sbt i1"D:\dev\bin\dotfiles"
i1 := {
    println("before")
    val args = argParser.parsed // : Seq[String]
    println(args)
    println("after")
}
