FROM nginx:latest

ENV AC_MAIN_DIR raml
ENV RAML_DIR /usr/share/nginx/html/api-console/$AC_MAIN_DIR
ENV AC_MAIN_FILE $AC_MAIN_DIR/api.raml

WORKDIR /

RUN \
 apt-get update &&\
 apt-get -y --no-install-recommends install git &&\
 apt-get autoclean && apt-get clean && apt-get autoremove

# Download and install https://github.com/gianebao/api-console
RUN \
 git clone https://github.com/gianebao/api-console &&\
 cp -r /api-console/dist /usr/share/nginx/html/api-console

WORKDIR /usr/share/nginx/html/api-console

RUN mkdir -p $RAML_DIR

# Point the raml-console-loader to the raml/api.raml
RUN sed -i \
 "s|<raml-initializer></raml-initializer>|<raml-console-loader src="$AC_MAIN_FILE" disable-theme-switcher disable-raml-client-generator></raml-console-loader>|g" \
 index.html

# Do some cleanup
RUN rm -rf examples /api-console
