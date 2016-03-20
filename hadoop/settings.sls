hadoop:
  hostgroups:
    hostgroup1:
      name: hostgroup1
      components:
        - [yarn, hive]
      cardinality: 1
      fqdns:
        - [fqdn1,fqdn2]
    hostgroup2:
      components:
        - [falcon, oozie]
      cardinality: 1
      fqdns:
        - [fqdn3,fqdn4]