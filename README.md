docker-h2
=========

I forked this from oscarfonts/docker-h2. I'll update the dockerfiles to use the latest h2 built Version 1.4.190

Dockerized H2 database service.


## Features

* A mix of [zhilvis/docker-h2](https://github.com/zhilvis/docker-h2) and [zilvinasu/h2-dockerfile](https://github.com/zilvinasu/h2-dockerfile).
* H2-DATA location on /opt/h2-data
* "geodb" tag with all the dependencies needed to run a geotools/geoserver H2 geospatial database (as per https://github.com/jdeolive/geodb).


## Running

Get the image:

```
docker pull oscarfonts/h2
```

Run as a service, exposing ports 1521 (TCP database server) and 81 (web interface) and mapping DATA_DIR to host:

```
docker run -d -p 1521:1521 -p 81:81 -v /path/to/local/data_dir:/opt/h2-data oscarfonts/h2 --name=MyH2Instance
```

See the logs while running:

```
docker logs -f MyH2Instance
```
