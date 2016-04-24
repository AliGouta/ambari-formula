{% from 'ambari/map.jinja' import ambari with context %}
{% from 'ambari/map.jinja' import version_mapping with context %}

include:
  - ambari.repo

{% if salt['grains.get']('os_family') == 'RedHat' %}
ambari-agent:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: ambari-agent

#ambari-agent-{{ambari.version}}-pkg:
#  pkg.latest:
#    - name: ambari-agent
#    - fromrepo: ambari-{{ ambari.version }}
#    - version: {{ ambari.version }}
{% endif %}

{% if salt['grains.get']('os_family') == 'Debian' %}
ambari-agent-{{ambari.version}}-pkg:
  pkg.installed:
    - name: ambari-agent
    - fromrepo: Ambari
    - version: {{ version_mapping.get(ambari.version) }}
{% endif %}

