hadoop:
  blueprint:
    clustername: "aramcheck"
    stack_name: "HDP"
    stack_version: "2.3"
  hostgroups:
    hostgroup1:
      name: hostgroup1
      components: [yarn, hive]
      cardinality: 1
      fqdns: [fqdn1,fqdn2]
    hostgroup2:
      name: hostgroup2
      components: [falcon, oozie]
      cardinality: 1
      fqdns: [fqdn3,fqdn4]