FROM ubuntu:16.04

RUN apt-get update --fix-missing && apt-get install -y \
    hostapd \
    dbus \
    net-tools \
    iptables \
    dnsmasq \
    iw \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY hostapd.conf /etc/hostapd/hostapd.conf
COPY hostapd /etc/default/hostapd
COPY dnsmasq.conf /etc/dnsmasq.conf

COPY entrypoint.sh /entrypoint.sh
COPY chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
