lazy val copydf = taskKey[Unit]("Dotfiles copy task")

copydf := {
    val dst = file("D:\\dev\\bin\\dotfiles")
    IO.delete(dst)
    IO.createDirectory(dst)
    // IO.copy(...).get map {f => (f, dst / f.getName)})
    val home = file("C:\\Users\\Ihar_Hancharenka")
    val vimfiles = home / "vimfiles"
    val filesToCopy = (
        (
	    (vimfiles ***)
	    --- (vimfiles / "bundle" ***)
	    --- (vimfiles ** ".*")
	)
        +++ (home / "_vimrc")
        +++ (home / "_gvimrc")
        +++ (home / "_pentadactylrc")
        ) pair Path.rebase(home, dst)
    // filesToCopy foreach {tup => println(tup._2) }
    IO.copy(filesToCopy)
} 
