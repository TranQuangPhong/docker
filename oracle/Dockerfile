# FROM oracleinanutshell/oracle-xe-11g:latest
FROM konnecteam/docker-oracle-12c:sequelize
WORKDIR /app
RUN apt-get update && apt-get install -y iputils-ping
RUN apt-get update && apt-get install -y vim
CMD ["/bin/bash"]
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 1521 5500

