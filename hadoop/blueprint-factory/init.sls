{% from 'hadoop/map.jinja' import hdpconfig with context %}

blueprint-factory:
  file:
    - append
    - name: /tmp/file.json
    - template: jinja
    - sources:
      - salt://hadoop/blueprint-factory/files/start-blueprint
      - salt://hadoop/blueprint-factory/files/blueprint-config-start-section
      - salt://hadoop/blueprint-factory/conf/base.conf
      - salt://hadoop/blueprint-factory/conf/kafka.conf
      - salt://hadoop/blueprint-factory/conf/gateway.conf
      - salt://hadoop/blueprint-factory/conf/falcon.conf
      - salt://hadoop/blueprint-factory/conf/hbase.conf
      - salt://hadoop/blueprint-factory/conf/hcat.conf
      - salt://hadoop/blueprint-factory/conf/hive.conf
      - salt://hadoop/blueprint-factory/conf/kafka.conf
      - salt://hadoop/blueprint-factory/conf/knox.conf
      - salt://hadoop/blueprint-factory/conf/oozie.conf
      - salt://hadoop/blueprint-factory/conf/pig.conf
      - salt://hadoop/blueprint-factory/conf/ranger.conf
      - salt://hadoop/blueprint-factory/conf/slider.conf
      - salt://hadoop/blueprint-factory/conf/sqoop.conf
      - salt://hadoop/blueprint-factory/conf/storm.conf
      - salt://hadoop/blueprint-factory/conf/webhcat.conf
      - salt://hadoop/blueprint-factory/conf/zookeeper.conf
      - salt://hadoop/blueprint-factory/files/blueprint-hostgroup-section