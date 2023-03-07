#!/usr/bin/env bash

# Exit gracefully
trap "exit" SIGINT
trap "exit" SIGTERM

echo "Downloading and/or updating server"

${STEAMCMDDIR}/steamcmd.sh +runscript update_zomboid.txt

echo "Starting server"

/opt/pzserver/start-server.sh -adminpassword ${ADMIN_PASSWORD} -servername ${SERVER_NAME} -port ${PORT} -udpport ${UDP_PORT} -steamvac ${STEAM_VAC} -steamport1 ${STEAM_PORT1} -steamport2 ${STEAM_PORT2}
