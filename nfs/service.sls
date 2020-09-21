{% from "nfs/map.jinja" import nfs with context %}

nfs-service:
{% if nfs.disabled %}
  service.dead:
{% if nfs.service_name is string %}
    - name: {{ nfs.service_name }}
{% elif nfs.service_name is iterable %}
    - names: {{ nfs.service_name }}
{% endif %}
    - enable: false
{% else %}
  service.running:
{% if nfs.service_name is string %}
    - name: {{ nfs.service_name }}
{% elif nfs.service_name is iterable %}
    - names: {{ nfs.service_name }}
{% endif %}
    - enable: true
{% endif %}
