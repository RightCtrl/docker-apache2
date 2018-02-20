# Apache2
Apache2 Docker
docker-composer.yml
```
version: '2'
services:
  Apache2proxy:
    image: rightctrl/proxy:apache2
    volumes:
     - ./proxy.conf:/etc/httpd/sites-enabled/proxy.conf
    environment:
       servn: "rightctrl.com"
       cname: "www"
       TIMEZONE: 'Asia/Tokyo'
    ports:
      - "90:80"
      - "9443:443"
    mem_limit: 3g
    cpuset: 0,1
    restart: always
    ulimits:
     nproc: 65535
     core: 0
     nofile:
      soft: 20000
      hard: 40000
```
