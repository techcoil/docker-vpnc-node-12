FROM node:12

LABEL maintainer="yaron@techmarketing.co.il"
LABEL version="0.0.1"

RUN apt-get update && \
		apt-get install -y \
        vpnc

COPY build_vpnc_conf.sh /usr/local/bin/build_vpnc_conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /root

ENTRYPOINT ["entrypoint.sh"]

CMD ["/bin/bash"]

