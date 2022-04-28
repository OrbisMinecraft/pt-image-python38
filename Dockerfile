FROM python:3.8-alpine 
LABEL author="Luis Michaelis"

LABEL \
    org.opencontainers.image.url='https://github.com/OrbisMinecraft/pt-image-python38' \
    org.opencontainers.image.source='https://github.com/OrbisMinecraft/pt-image-python38/tree/main' \
    org.opencontainers.image.title='A Python 3.8 image for Pterodactyl' \
    org.opencontainers.image.authors='Luis Michaelis <lmichaelis.all+dev@gmail.com>' \
    org.opencontainers.image.description='A Python 3.8 image for Pterodactyl'
    

RUN addgroup -S container && adduser -S container -S container

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

CMD ["/bin/sh", "/entrypoint.sh"]
