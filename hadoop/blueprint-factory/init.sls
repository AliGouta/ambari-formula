{% from 'hadoop/map.jinja' import hdpconfig with context %}

blueprint-factory:
  file:
    - append
    - name: /tmp/file.json
    - template: jinja
    - sources:
      - salt://hadoop/blueprint-factory/files/start-blueprint
      - salt://hadoop/blueprint-factory/files/blueprint-start-config-section