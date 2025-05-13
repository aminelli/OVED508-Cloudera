FROM aci-hadoop:3.4.1

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]