FROM cm2network/steamcmd:steam

ENV ADMIN_PASSWORD=changeme
ENV SERVER_NAME=myserver

COPY --chown=${USER} ./scripts ./

USER root

RUN mkdir /opt/pzserver && \
    chown ${USER} /opt/pzserver && \
    chmod 774 ./run.sh ./update_zomboid.txt

USER ${USER}

EXPOSE 16261
EXPOSE 16262

ENTRYPOINT [ "/bin/bash", "./run.sh" ]
