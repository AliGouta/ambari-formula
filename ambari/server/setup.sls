{% from 'ambari/map.jinja' import ambari with context %}

include:
  - ambari.server

ambari-server-setup:
  cmd.wait:
    - name: ambari-server setup -s
    - watch:
      - pkg: ambari-server-pkg
      - file: ambari-redhat-satellite
