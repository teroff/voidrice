source ~/.aliases

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export CLASSPATH=$CLASSPATH:/usr/local/aws-mysql-jdbc-1.1.7.jar

# THIS IS THE OLD STUFF THAT USED TO WORK AND DON'T ANYMORE
#JAVA_11_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/"
#PATH=${JAVA_11_HOME}/bin:${PATH}
#export PATH

# NEW JAVA11 SOURCE
export JAVA_HOME=/opt/homebrew/opt/java11
export PATH="/opt/homebrew/opt/java11/bin:$PATH"
