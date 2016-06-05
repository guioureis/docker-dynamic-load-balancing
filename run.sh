docker run -t -d -p 8080:5004 marcells/aspnet-hello-world
docker run -dit -v /vagrant/infra/provision/consul:/etc/consul -p 8500:8500 gliderlabs/consul-server -bootstrap -config-dir=/etc/consul
docker run -dit -v /var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator -resync 120 -retry-attempts -1 -retry-interval 2000 --cleanup consul://172.17.0.1:8500

