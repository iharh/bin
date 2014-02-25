import complete.DefaultParsers._
//import complete.Parser._

lazy val dstPath = settingKey[String]("Dst path")
lazy val dstPath2 = settingKey[String]("Dst path 2")
lazy val copydf = taskKey[Unit]("Dotfiles copy task")
lazy val e1 = taskKey[Unit]("Echo some staff task")
lazy val s1 = taskKey[Unit]("Echo some state task")
lazy val i1 = inputKey[Unit]("Some input task")

val argParser = OptSpace ~> token(StringBasic, "<arg>") // = spaceDelimited("<arg>")
// StringBasic.examples("<arg>") // : Parser[String]

dstPath := "D:\\dev\\bin\\dotfiles"

dstPath2 := "D:\\dev\\bin\\dotfiles2"

// pollInterval := 1000 // in ms for ~tasks

copydf := {
    val dst = file(dstPath.value)
    IO.delete(dst)
    IO.createDirectory(dst)
    // IO.copy(...).get map {f => (f, dst / f.getName)})
    val home = Path.userHome // .absolutePath
    val vimfiles = home / "vimfiles"
    val filesToCopy = (
        (
	    (vimfiles ***)
	    --- (vimfiles / "bundle" ***)
	    --- (vimfiles ** ".*")
	)
        +++ (home * "_*rc")
	+++ (home / ".vimsauce" ***)
    )
    val rebasedFilesToCopy = filesToCopy pair Path.rebase(home, dst)
    // rebasedFilesToCopy foreach {tup => println(tup._2) }
    IO.copy(rebasedFilesToCopy)
} 

e1 := {
    println("aaa")
}

// http://www.scala-sbt.org/release/docs/Extending/Build-State.html
// http://www.scala-sbt.org/release/docs/Detailed-Topics/Tasks
// http://stackoverflow.com/questions/11665597/where-are-all-settingt-stored-in-sbt-0-11

// http://jackviers.blogspot.com/2012/01/sbt-scalas-simple-build-tool-series_16.html

def ddd(v: String) = println(v)

//sealed trait Settings[Scope]
//{
//	def data: Map[Scope, AttributeMap]
//	def keys(scope: Scope): Set[AttributeKey[_]]
//	def scopes: Set[Scope]
//	def definingScope(scope: Scope, key: AttributeKey[_]): Option[Scope]
//	def allKeys[T](f: (Scope, AttributeKey[_]) => T): Seq[T]
//	def get[T](scope: Scope, key: AttributeKey[T]): Option[T]
//	def getDirect[T](scope: Scope, key: AttributeKey[T]): Option[T]
//	def set[T](scope: Scope, key: AttributeKey[T], value: T): Settings[Scope]
//}

s1 := {
    ddd(dstPath.value)
    ddd(dstPath2.value)
    // structure.data - BuildStructure
    // val data: Settings[Scope]
    //println(extracted.getOpt(dstPath))
    //val extracted: Extracted = Project.extract(state.value)
    //println(extracted.structure.data.get(dstPath.scope.copy(project = Select(extracted.currentRef)), dstPath.key))
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
