// TODO: seems to be optional
//name := "m1"

//version := "1.0-SNAPSHOT"

scalaVersion := "2.10.3"

scalacOptions ++= Seq("-encoding", "UTF-8", "-Xlint","-deprecation", "-unchecked")

javacOptions ++= Seq("-encoding", "UTF-8", "-Xlint:unchecked", "-Xlint:deprecation")

testOptions += Tests.Argument(TestFrameworks.JUnit, "-q", "-a")

//logLevel := Level.Debug
//Warn Info

libraryDependencies ++= Seq(
  "org.apache.httpcomponents" % "httpclient" % "4.3.1",
  "com.thoughtworks.xstream"  % "xstream"    % "1.4.5",
  //"org.scalatest"      % "scalatest_2.10"   % "1.9.1"   % "test",
  //"commons-io"                % "commons-io"         % "2.4"     % "test"
  "com.novocode"              % "junit-interface"    % "0.10"    % "test",
  "junit"                     % "junit"              % "4.11"    % "test",
  "org.hamcrest"              % "hamcrest-library"   % "1.3"     % "test",
  "com.google.guava"          % "guava"              % "15.0"    % "test"
)

