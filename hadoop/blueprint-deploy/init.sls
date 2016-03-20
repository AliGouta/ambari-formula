{% from 'hadoop/map.jinja' import hdpconfig with context %}

blueprint-deploy:
  file:
    - append
    - name: /tmp/file.json
    - template: jinja
    - sources:
      - salt://hadoop/blueprint-deploy/files/cluster-deploy.json