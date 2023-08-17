source ~/.aliases

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export CLASSPATH=$CLASSPATH:/usr/local/aws-mysql-jdbc-1.1.7.jar


JAVA_11_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/"
PATH=${JAVA_11_HOME}/bin:${PATH}
export PATH
