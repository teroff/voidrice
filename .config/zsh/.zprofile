source ~/.aliases

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set PATH for JAVA
#JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home
#PATH="${JAVA_HOME}/bin:${PATH}"
#export PATH


JAVA_11_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home/"
PATH=${JAVA_11_HOME}/bin:${PATH}
export PATH

