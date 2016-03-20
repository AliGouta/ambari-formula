{% from 'hadoop/map.jinja' import hdpconfig with context %}

blueprint-factory:
  file:
    - append
    - name: /tmp/file.json
    - template: jinja
    - source: salt://hadoop/blueprint-factory/files/start-blueprint