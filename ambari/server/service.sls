{% from 'ambari/map.jinja' import ambari with context %}

include:
  - ambari.server

ambari-server-svc:
  service.running:
    - name: ambari-server
    - enable: True
    - require_in:
      - pkg: ambari-server-pkg
    - watch:
      - file: ambari-server-properties
