FROM java:7

# A merge of:
#  https://github.com/zhilvis/docker-h2
#  https://github.com/zilvinasu/h2-dockerfile
# Plus dependencies from:
#  https://github.com/jdeolive/geodb/tree/0.7-RC2

MAINTAINER Oscar Fonts <oscar.fonts@geomati.co>

ENV DOWNLOAD https://h2database.googlecode.com/files/h2-2009-09-26.zip
ENV DATA_DIR /opt/h2-data

RUN curl ${DOWNLOAD} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip \
    && mkdir -p ${DATA_DIR}

RUN cd /opt/h2/bin \
    && wget http://download.osgeo.org/webdav/geotools/org/opengeo/geodb/0.7-RC2/geodb-0.7-RC2.jar \
    && wget https://repo1.maven.org/maven2/com/vividsolutions/jts/1.12/jts-1.12.jar \
    && wget https://repo1.maven.org/maven2/xerces/xercesImpl/2.4.0/xercesImpl-2.4.0.jar \
    && wget https://boundless.artifactoryonline.com/boundless/boundlessgeo-cache/net/sourceforge/hatbox/hatbox/1.0.b7/hatbox-1.0.b7.jar

EXPOSE 81 1521

CMD java -cp "/opt/h2/bin/*" org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR}
