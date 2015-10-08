FROM jeanblanchard/java:latest
MAINTAINER tobilg <fb.tools.github@gmail.com>

ENV APP_PATH /app
ENV CONFIG_FILE $APP_PATH/zk-web/conf/zk-web-conf.clj
ENV LEIN_ROOT true

ADD install.sh .
ADD bootstrap.sh .

RUN chmod +x install.sh
RUN chmod +x bootstrap.sh

RUN ./install.sh

CMD ["./bootstrap.sh"]