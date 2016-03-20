
blueprint-deploy:
  file-managed:
    - name: /tmp/file-deploy.json
    - source: salt://hadoop/blueprint-deploy/files/cluster-deploy.json
    - template: jinja
    - sources:
      - salt://hadoop/blueprint-deploy/files/cluster-deploy.json