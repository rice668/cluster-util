#!/bin/bash

CMD_BASE="hadoop org.apache.hadoop.hdfs.ErasureCodeBenchmarkThroughput write 12288 "
CMD_REP="rep"
CMD_EC="ec"

function run()
{
  for i in 1 5 10 20
  do
    echo "$i client writing ..."
    $CMD_BASE $1 $i
    echo
  done
}

echo "Test 3-replica ..."
run $CMD_REP

echo "Test HDFS-RAID ..."
cp -f $HADOOP_CONF_DIR/coders/core-site.xml.raid $HADOOP_CONF_DIR/core-site.xml
run $CMD_EC

echo "Test New-Java ..."
cp -f $HADOOP_CONF_DIR/coders/core-site.xml.newjava $HADOOP_CONF_DIR/core-site.xml
run $CMD_EC

echo "Test ISA-L ..."
cp -f $HADOOP_CONF_DIR/coders/core-site.xml.isa $HADOOP_CONF_DIR/core-site.xml
run $CMD_EC
