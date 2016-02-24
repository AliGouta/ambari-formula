{% from 'ambari/map.jinja' import ambari with context %}

include:
  - ambari.server

ambari-server-setup:
  cmd.running:
    - name: ambari-server setup -s
    - require_in:
      - pkg: ambari-server-pkg
    - watch:
      - file: ambari-server-satellite