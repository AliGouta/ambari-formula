{% from 'ambari/map.jinja' import ambari with context %}

include:
  - ambari.server

ambari-server-setup:
  cmd.run:
    - name: ambari-server setup -s
    - require_in:
      - pkg: ambari-server-pkg
      - file: ambari-redhat-satellite
