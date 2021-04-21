FROM redis:4.0.10

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl -y
#RUN ln -s /usr/bin/nodejs /usr/bin/node
#RUN npm install redis-dump -g

#Time
ENV TW=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TW /etc/localtime && echo $TW > /etc/timezone

COPY conf/redis.conf /usr/local/etc/redis/redis.conf
RUN chmod 777 /usr/local/etc/redis/redis.conf

COPY conf/entrypoint.sh /
RUN chmod 777 /entrypoint.sh

#EXPOSE 6379
#CMD [ "redis-server","/usr/local/etc/redis/redis.conf" ]
ENTRYPOINT ["/entrypoint.sh"]
