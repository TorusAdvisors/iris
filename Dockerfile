FROM intersystemsdc/iris-community
USER root

WORKDIR /opt/irisbuild
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisbuild
USER ${ISC_PACKAGE_MGRUSER}

COPY src src
COPY init/Installer.cls Installer.cls
COPY init/iris.script iris.script
COPY module.xml module.xml

RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly