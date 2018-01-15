# DockerRails
Vue + Rails

# Environment
- rails 5.1.4
- ruby 2.4.1

# Useage

```bash
$ docker-compose build
$ docker-compose run --rm app rake db:create
$ docker-compose up -d
## open other tab (watch and compile JS)
$ docker-compose exec app bash
$ bin/webpack-dev-server
```

access to localhost:3000
