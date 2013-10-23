//import java.io.File._
import java.io.File
import java.util.regex.Pattern

lazy val hello1 = taskKey[Unit]("An example task")

hello1 := {
  //val pattern = "**/.build/**/*.*"
  val pattern = "*.build*"
  var regex = new StringBuilder()
  var pos = 0
  val components = pattern.split("[*?]");
  components.map(str => {
    if (str.length() > 0) {
      // Quote the characters up to next wildcard or end of string.
      regex.append(Pattern.quote(str));
      pos += str.length();
    }
    if (pos < pattern.length()) {
      // Replace wildcard with equivalent regular expression.
      if (pattern.charAt(pos) == '*') {
        regex.append(".*");
      } else {
        // assert pattern.charAt(pos) == '?';
        regex.append('.');
      }
      pos = pos + 1;
    }
    println("str: " + str + " pos: " + pos)
  })
  println("Hello 1!" + File.separator + regex.toString())
} 
