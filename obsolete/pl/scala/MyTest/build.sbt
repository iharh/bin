version := "1.0-SNAPSHOT"

scalaVersion := "2.10.0"

scalacOptions ++= Seq("-encoding", "UTF-8", "-Xlint","-deprecation", "-unchecked")

javacOptions ++= Seq("-Xlint:unchecked", "-Xlint:deprecation")

testOptions += Tests.Argument(TestFrameworks.JUnit, "-q", "-a")

libraryDependencies ++= Seq(
  "com.netflix.rxjava" % "rxjava-core"      % "0.5.3",
  //
  "junit"              % "junit"            % "4.11"    % "test",
  "org.hamcrest"       % "hamcrest-library" % "1.3"     % "test",
  "com.novocode"       % "junit-interface"  % "0.10-M2" % "test",
  "org.scalatest"      % "scalatest_2.10"   % "1.9.1"   % "test"
)

