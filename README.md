# nginx-api-console
Docker image for RAML API console based on NGinX

[NGinX](https://hub.docker.com/_/nginx/) [api-console](https://github.com/gianebao/api-console) for [RAML](http://raml.org/)

Docker image based on [NGinX](https://hub.docker.com/_/nginx/)
Docker image at [gianebao/bitbucket-pipeline-go-mysql](https://hub.docker.com/r/gianebao/nginx-api-console/)

Sample `Dockerfile`:

```Docker
FROM gianebao/nginx-api-console

# Add the entire library to the RAML folder
ADD . $AC_MAIN_DIR

# Make sure that the main file should be raml/api.raml
RUN mv raml/my_api.raml $AC_MAIN_FILE

# Mount the raml folder
VOLUME ["$AC_MAIN_DIR"]
```
