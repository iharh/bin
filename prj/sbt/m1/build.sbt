// TODO: seems to be optional
name := "m1"

version := "1.0-SNAPSHOT"

scalaVersion := "2.10.3"

scalacOptions ++= Seq("-encoding", "UTF-8", "-Xlint","-deprecation", "-unchecked")

javacOptions ++= Seq("-encoding", "UTF-8", "-Xlint:unchecked", "-Xlint:deprecation")

testOptions += Tests.Argument(TestFrameworks.JUnit, "-q", "-a")

libraryDependencies ++= Seq(
  "org.apache.httpcomponents" % "httpclient" % "4.3.1",
  "com.thoughtworks.xstream"  % "xstream"    % "1.4.5",
  //"commons-httpclient" % "commons-httpclient" % "3.1",
  //"org.hamcrest"       % "hamcrest-library" % "1.3"     % "test",
  //"org.scalatest"      % "scalatest_2.10"   % "1.9.1"   % "test",
  "com.novocode"              % "junit-interface"    % "0.10"    % "test",
  "junit"                     % "junit"              % "4.11"    % "test"
)

