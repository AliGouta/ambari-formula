{% from 'ambari/map.jinja' import ambari with context %}
{% from 'ambari/map.jinja' import version_mapping with context %}

include:
  - ambari.repo
  - ambari.common
  {% if ambari.agent.start_service %}
  - ambari.agent.service
  {% endif %}

{% if salt['grains.get']('os_family') == 'RedHat' %}
ambari-server-pkg:
  pkg.installed:
      - pkgs:
        - ambari-agent
{% endif %}

{% if salt['grains.get']('os_family') == 'Debian' %}
ambari-agent-{{ambari.version}}-pkg:
  pkg.installed:
    - name: ambari-agent
    - fromrepo: Ambari
    - version: {{ version_mapping.get(ambari.version) }}
{% endif %}

ambari-agent-config:
  file.managed:
    - name: /etc/ambari-agent/conf/ambari-agent.ini
    - source: salt://ambari/agent/files/ambari-agent.ini
    - template: jinja
    - mode: 0640
    - user: root
    - group: root
    - makedirs: True
    - require_in:
      - pkg: ambari-server-pkg


