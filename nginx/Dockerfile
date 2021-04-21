FROM nginx:1.15.1-alpine
#FROM nginx:1.13.3-alpine

RUN apk update && \
    apk --no-cache add bash tzdata curl ca-certificates s6 ssmtp mysql-client \
    nginx nginx-mod-http-headers-more nginx-mod-http-lua

#Time
ENV TW=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TW /etc/localtime && echo $TW > /etc/timezone  


EXPOSE 80
CMD ["nginx","-g","daemon off;"]
