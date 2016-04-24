{% from 'ambari/map.jinja' import ambari with context %}
{% from 'ambari/map.jinja' import version_mapping with context %}

#Ali edited this file
# Sets which user is running ambari-server
{% set ambari_user = ambari.server.ambari_server.user %}

include:
  - ambari.repo

{% if salt['grains.get']('os_family') == 'RedHat' %}
ambari-server-pkg:
  pkg:
      - installed
{% endif %}

ambari-redhat-satellite:
  file.managed:
    - name: /var/lib/ambari-server/resources/stacks/HDP/2.0.6/configuration/cluster-env.xml
    - source: salt://ambari/server/files/cluster-env.xml
    - template: jinja
    - user: {{ ambari_user }}
    - group: root
    - permission: 0644
