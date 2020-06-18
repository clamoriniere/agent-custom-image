FROM datadog/agent:7.20.2

# install a custom conf
COPY ./conf.d/hello.d/conf.yaml conf.d/hello.d/

# install a custom check
COPY ./checks.d/hello.py checks.d/hello.py