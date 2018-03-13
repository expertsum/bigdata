FROM spark-base

ENV SPARK_NO_DAEMONIZE 1
ENV SPARK_PUBLIC_DNS localhost

ENTRYPOINT ["tini", "--"]
CMD ["/opt/spark/sbin/start-history-server.sh"]
