# Awesome Docker Compose

Clone repo:
```sh
cd /opt
git clone https://github.com/d1ys3nk0/docker-compose-boilerplate.git apps
cd /opt/apps
```

Create configs:
```sh
make setup
```

Adjust configuration:
```sh
vi docker-compose.yml
vi docker-compose.init.yml
vi .env
```

Start apps:
```sh
make start-infra
make init
make start
```
