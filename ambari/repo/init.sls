{% if salt['grains.get']('os_family') == 'RedHat' %}

/etc/yum.repos.d/HDP.repo:
  file.managed:
    - source: salt://ambari/repo/files/HDP.repo
    - template: jinja
    - user: root
    - group: root
    - permission: 0644

hdp-utils-repos:
  file.managed:
    - name: /etc/yum.repos.d/HDP-UTILS.repo
    - source: salt://ambari/repos/files/HDP-UTILS.repo
    - template: jinja
    - user: root
    - group: root
    - permission: 0644
{% endif %}
