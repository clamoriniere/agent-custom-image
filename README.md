# how to build a custom datadog-agent image

## Dockerfile

The docker file takes as base image the lastest datadog/agent image.

To use the latest you can run `docker pull datadog/agent:7` before running the `docker build` command.

```dockerfile
FROM datadog/agent:7

# install a custom conf
COPY ./conf.d/hello.d/conf.yaml conf.d/hello.d/

# install a custom check
COPY ./checks.d/hello.py checks.d/hello.py

```

if you want to build an image with the JMX support, the base image is: `datadog/agent:7-jmx`

## build the image

```shell
docker build -t mycustom/agent .
```

## run the agent

```shell
docker run -d --name dd-agent -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -e DD_API_KEY=$DD_API_KEY mycustom/agent

```
