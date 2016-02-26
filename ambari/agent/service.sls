{% from 'ambari/map.jinja' import ambari with context %}

include:
  - ambari.agent

ambari-agent-svc:
  service.running:
    - name: ambari-agent
    - enable: True
    - require:
      - pkg: ambari-agent-pkg
    - watch:
      - file: ambari-agent-config
