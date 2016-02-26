{% from 'ambari/map.jinja' import ambari with context %}

include:
  - ambari.server
  - ambari.server.setup

ambari-server-svc:
  service.running:
    - name: ambari-server
    - enable: True
    - require:
      - pkg: ambari-server-pkg
      - sls: ambari.server.setup
