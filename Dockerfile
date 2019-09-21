FROM anapsix/alpine-java:8

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ENV WM_PACKAGE wiremock
ARG WM_VERSION=2.24.1

RUN mkdir /$WM_PACKAGE
WORKDIR /$WM_PACKAGE
RUN curl -sSL -o $WM_PACKAGE.jar https://repo1.maven.org/maven2/com/github/tomakehurst/$WM_PACKAGE-standalone/$WM_VERSION/$WM_PACKAGE-standalone-$WM_VERSION.jar

# new directories
RUN mkdir /$WM_PACKAGE/mappings
RUN mkdir /$WM_PACKAGE/__files

COPY mappings /$WM_PACKAGE/mappings
COPY __files /$WM_PACKAGE/__files
RUN chmod g+w /$WM_PACKAGE
RUN chmod 777 /$WM_PACKAGE
RUN chmod 777 /$WM_PACKAGE/__files
RUN chmod 777 /$WM_PACKAGE/mappings

EXPOSE 8080

ENTRYPOINT ["java","-jar","wiremock.jar"]