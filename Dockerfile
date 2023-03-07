FROM cm2network/steamcmd:steam

ENV ADMIN_PASSWORD=changeme
ENV SERVER_NAME=myserver
ENV PORT=16271
ENV UDP_PORT=16272
ENV STEAM_VAC=true
ENV STEAM_PORT1=8766
ENV STEAM_PORT2=8767

ARG PUID=1000

COPY --chown=${PUID} ./scripts ./

USER root

RUN mkdir /opt/pzserver && \
    chown ${PUID}:${USER} -R /opt/pzserver ${HOMEDIR} && \
    chmod 774 ./run.sh ./update_zomboid.txt

USER ${USER}

ENTRYPOINT [ "/bin/bash", "./run.sh" ]
