# Enter the tcp ports to allow access.
# For example, ssh, http and https would look like this:
# default[:simple_iptables][:ports_allow] = [ 22,80,443 ]
# For a list of ports, see: http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
default[:simple_iptables][:ports_allow] = [ 22 ]
