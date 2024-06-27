B_PATH=.
for i in ../../lib/*.jar; do
LIB_PATH=${LIB_PATH}:$i
done

for i in ../../serverLib/*.jar; do
LIB_PATH=${LIB_PATH}:$i
done


$JAVA_HOME/bin/java -server -Xmx5512m -XX:MaxDirectMemorySize=256M -verbose:gc -Djava.awt.headless=true -classpath .:$CLASSPATH:$LIB_PATH:channelserver.jar com.wyd.channel.Server >> stdout.log 2>&1 &

echo $! > ChannelServer.pid
