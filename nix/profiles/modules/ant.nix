{ ant, oraclejdk8, supportsJDK }:

let

  # x86_64-darwin is not supported
  packages = [
    ant
  ] ++ (if supportsJDK then [ oraclejdk8 ] else []);

  environmentVariables =
    if supportsJDK
    then {}
    else { JAVA_HOME = /Library/Java/JavaVirtualMachines/jdk1.8.0_71.jdk/Contents/Home; }; # /usr/libexec/java_home

in

{ inherit packages environmentVariables; }
