bind_addr = "{{ nomad_bind_addr }}"
data_dir  = "{{ nomad_datadir }}"

advertise {
  rpc = "{{ nomad_advertise_ip }}:4647"
}

server {
  enabled = true
  {% if nomad_bootstrap_expect > 0 %}
  bootstrap_expect = {{ nomad_bootstrap_expect }}
  {% endif %}
}

client {
  enabled = true
  network_speed = 10
  network_interface = "{{ nomad_client_network_interface }}"
}
