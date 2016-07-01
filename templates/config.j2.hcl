bind_addr = "{{ nomad_bind_addr }}"
data_dir  = "{{ nomad_datadir }}"

advertise {
  http = "{{ nomad_http_ip }}:4646"
  rpc  = "{{ nomad_rpc_ip }}:4647"
  serf = "{{ nomad_serf_ip }}:4648"
}

{% if nomad_server %}
server {
  enabled = true
  {% if nomad_bootstrap_expect > 0 %}
  bootstrap_expect = {{ nomad_bootstrap_expect }}
  {% endif %}
}
{% endif %}

{% if not nomad_server %}
client {
  enabled = true
  network_speed = 10
  network_interface = "{{ nomad_client_network_interface }}"
  servers = {{ nomad_servers | to_json }}
  options = {
    {% if nomad_raw_exec_enabled %}
    "driver.raw_exec.enable" = "1"
    {% endif %}
  }
}
{% endif %}
