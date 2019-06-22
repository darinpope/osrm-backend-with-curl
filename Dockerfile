FROM osrm/osrm-backend

RUN apt-get update && \
    apt-get install curl