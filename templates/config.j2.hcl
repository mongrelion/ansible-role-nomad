bind_addr = "{{ nomad_bind_addr }}"
data_dir  = "{{ nomad_datadir }}"

advertise {
  rpc = "{{ nomad_advertise_ip }}:4647"
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
