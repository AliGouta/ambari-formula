{% from 'ambari/map.jinja' import sys with context %}

yum-cache-config:
  file.managed:
    - name: /etc/yum.reposd/yum.conf
    - source: salt://ambari/common/files/yum.conf
    - template: jinja
    - mode: 0644
    - user: root
    - group: root

