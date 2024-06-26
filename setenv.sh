# This is the file bin/setenv.sh,
# it will be sourced in by bin/jmeter

# Use a bigger heap, but a smaller metaspace, than the default
# export HEAP="-Xms8g -Xmx8g -XX:MaxMetaspaceSize=2g"
export HEAP="-Xms2g -Xmx4g -XX:+UseG1GC -XX:MaxGCPauseMillis=200  -XX:MaxMetaspaceSize=2g"
