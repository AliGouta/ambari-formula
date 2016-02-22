{% from 'ambari/map.jinja' import ambari with context %}
{% from 'ambari/map.jinja' import version_mapping with context %}

# Sets which user is running ambari-server
{% set ambari_user = ambari.server.ambari_server.user %}

include:
  - ambari.repo
  {% if ambari.server.start_service %}
  - ambari.server.service
  {% endif %}

{% if salt['grains.get']('os_family') == 'RedHat' %}
ambari-server-{{ambari.version}}-pkg:
  pkg.latest:
    - name: ambari-server
    - fromrepo: ambari-{{ ambari.version }}
    - version: {{ ambari.version }}
{% endif %}

{% if salt['grains.get']('os_family') == 'Debian' %}
ambari-server-{{ambari.version}}-pkg:
  pkg.installed:
    - name: ambari-server
    - fromrepo: Ambari
    - version: {{ version_mapping.get(ambari.version) }}
{% endif %}


ambari-redhat-satellite:
  file.managed:
    - name: /var/lib/ambari-server/resources/stacks/HDP/2.0.6/configuration/cluster-env.xml
    - source: salt://ambari/server/files/cluster-env.xml
    - template: jinja
    - user: {{ ambari_user }}
    - group: root
    - permission: 0644

ambari-server-properties:
  file.managed:
    - name: /etc/ambari-server/conf/ambari.properties
    - source: salt://ambari/server/files/ambari.properties
    - template: jinja
    - user: {{ ambari_user }}
    - group: root
    - permission: 0644

ambari-server-log4j:
  file.managed:
    - name: /etc/ambari-server/conf/log4j.properties
    - source: {{ ambari.server.log4j }}
    - template: jinja
    - user: {{ ambari_user }}
    - group: root
    - permission: 0644

ambari-server-jass:
  file.managed:
    - name: /etc/ambari-server/conf/krb5JAASLogin.conf
    - source: salt://ambari/server/files/krb5JAASLogin.conf
    - template: jinja
    - user: {{ ambari_user }}
    - group: root
    - permission: 0644
