FROM frolvlad/alpine-mono

MAINTAINER Yuki Hyou <snowleopard@amused.com.au>

ARG USER=windward
ARG GROUP=windward
ARG PUID=1000
ARG PGID=1000

ENV WINDWARD_SERVER_NAME="Windward Server" \
    WINDWARD_SERVER_WORLD="World" \
    WINDWARD_SERVER_PORT=5127 \
    WINDWARD_SERVER_PUBLIC=0

RUN apk --update --no-cache add unzip

RUN mkdir -p /windward	&&	\
    chmod ugo=rwx /windward && \
	addgroup -g $PGID -S $GROUP && \
	adduser -u $PUID -G $USER -s /bin/sh -SDH $GROUP && \
    chown -R $USER:$GROUP /windward
	
VOLUME /windward

EXPOSE $WINDWARD_SERVER_PORT

COPY ./windward.sh /

USER $USER

CMD ["/windward.sh"]
