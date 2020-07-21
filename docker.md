### List all containers

```
docker container ls -a
```

https://docs.docker.com/engine/reference/commandline/container_ls/


### Stop a container

```
# SIGTERM first, then SIGKILL after 10 seconds
docker stop <container>

# SIGKILL right off the bat
docker kill <container>
```

https://www.ctl.io/developers/blog/post/gracefully-stopping-docker-containers/


### View image details

```
docker image inspect <IMAGE_NAME>
```

https://docs.docker.com/engine/reference/commandline/image_inspect/


### View logs

```
docker ps  # to see running contains
docker logs <CONTAINER_ID>
```


### Up, run, start

Generally want to use `up` to start everything. `run` is for running specific services and their dependencies. `start` is for starting stopped services.

https://docs.docker.com/compose/faq/#whats-the-difference-between-up-run-and-start


### Example Commands

Remember to start Docker program in Applications first.

```
docker image load -i <file>

docker images

# -i means interactive
# -t means "Allocate a pseudo-TTY"
docker run -it <rhel-image> bash
```