FROM cm2network/steamcmd:steam

ENV ADMIN_PASSWORD=changeme
ENV SERVER_NAME=myserver
ENV PORT=16271
ENV UDP_PORT=16272
ENV STEAM_VAC=true

ARG GID=1000

COPY --chown=${USER} ./scripts ./

USER root

RUN groupadd -f ${GID} && \
    usermod -a -G ${GID} ${USER} && \
    mkdir /opt/pzserver && \
    chown ${USER}:${GID} -R /opt/pzserver ${HOMEDIR} ./run.sh ./update_zomboid.txt && \
    chmod 770 ./

USER ${USER}

ENTRYPOINT [ "/bin/bash", "./run.sh" ]
