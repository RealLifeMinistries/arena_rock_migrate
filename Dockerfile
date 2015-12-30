FROM rails:onbuild
MAINTAINER Nik Petersen

RUN apt-get update && apt-get install -y freetds-bin freetds-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*

CMD ['bin/start']
