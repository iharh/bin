scalaVersion := "2.10.3"

scalacOptions ++= Seq("-encoding", "UTF-8", "-Xlint","-deprecation", "-unchecked")

javacOptions ++= Seq("-encoding", "UTF-8", "-Xlint:unchecked", "-Xlint:deprecation")

testOptions += Tests.Argument(TestFrameworks.JUnit, "-q", "-a")

libraryDependencies ++= Seq(
  "org.apache.httpcomponents" % "httpclient"     % "4.3.1",
//
  "com.thoughtworks.xstream"  % "xstream"        % "1.4.5",
  "org.slf4j"                 % "slf4j-api"      % "1.7.5",
  "org.slf4j"                 % "slf4j-log4j12"  % "1.7.5",
  "log4j"                     % "log4j"          % "1.2.17",
//
  "com.novocode"              % "junit-interface"    % "0.10"    % "test",
  "junit"                     % "junit"              % "4.11"    % "test",
  "org.hamcrest"              % "hamcrest-library"   % "1.3"     % "test",
  "com.google.guava"          % "guava"              % "15.0"    % "test"
)

