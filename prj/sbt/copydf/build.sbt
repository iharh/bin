lazy val copydf = taskKey[Unit]("Dotfiles copy task")
lazy val e1 = taskKey[Unit]("Echo some staff task")

copydf := {
    val dst = file("D:\\dev\\bin\\dotfiles")
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
