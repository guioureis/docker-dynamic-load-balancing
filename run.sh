docker run -dit -P marcells/aspnet-hello-world
docker run -dit -v /vagrant/infra/provision/consul:/etc/consul -p 8500:8500 gliderlabs/consul-server -bootstrap -config-dir=/etc/consul
docker run -dit -v /var/run/docker.sock:/tmp/docker.sock gliderlabs/registrator -resync 120 -retry-attempts -1 -retry-interval 2000 -ip 172.17.0.1 --cleanup consul://172.17.0.1:8500
docker run -dit -v /vagrant/infra/provision/haproxy:/tmp:rw --net=host sirile/haproxy -consul=localhost:8500
