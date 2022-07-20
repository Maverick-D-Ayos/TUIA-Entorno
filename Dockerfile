FROM ubuntu
MAINTAINER Juan Pablo Ayala "lozziajuan@gmail.com"

RUN apt-get update && apt-get install -y gawk nano bc && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 menu.sh .
COPY --chmod=0755 Scripts /Scripts

ENTRYPOINT ["/bin/bash", "/menu.sh"]
