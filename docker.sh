set -x
dockerd -b none --iptables=0 -l warn &
for i in $(seq 5); do [ ! -S "/var/run/docker.sock" ] && sleep 2 || break; done
docker pull hello-world
kill $(jobs -p)
