{% if salt['grains.get']('os_family') == 'RedHat' %}

hdp-repos:
  cp.get_file:
    - path: salt://ambari/repos/files/HDP.repo
    - dest: /etc/yum.repos.d

hdp-utils-repos:
  file.managed:
    - name: /etc/yum.repos.d/HDP-UTILS.repo
    - source: salt://ambari/repos/files/HDP-UTILS.repo
    - template: jinja
    - user: root
    - group: root
    - permission: 0644
{% endif %}
