{% from 'ambari/map.jinja' import ambari with context %}

include:
  - ambari.server

ambari-server-setup:
  cmd.wait:
    - name: export http_proxy="http://gecd-proxy.equities.net.intra:8080/" && export https_proxy="http://gecd-proxy.equities.net.intra:8080/" && ambar-iserver setup -s
    - watch:
      - pkg: ambari-server-pkg
      - file: ambari-redhat-satellite
