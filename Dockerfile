FROM bitnami/kafka:2.8.0

# Download the JMX exporter
USER root
ADD https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar /usr/app/jmx_prometheus_javaagent.jar
COPY kafka-jmx-exporter-config.yml /usr/app/kafka-jmx-exporter-config.yml

# Change permissions to be executable
RUN chmod +r /usr/app/jmx_prometheus_javaagent.jar
USER 1001
