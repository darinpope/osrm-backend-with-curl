FROM osrm/osrm-backend:v5.22.0

RUN apt-get update && \
    apt-get install -y wget && \
    mkdir -p /data && \
    cd /data && \
    wget http://download.geofabrik.de/europe/monaco-latest.osm.pbf && \
    osrm-extract -p /opt/car.lua /data/monaco-latest.osm.pbf && \
    osrm-contract /data/monaco-latest.osrm

EXPOSE 5000

ENTRYPOINT osrm-routed /data/monaco-latest.osrm
