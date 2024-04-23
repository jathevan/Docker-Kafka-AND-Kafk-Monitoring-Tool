
# Docker Kafka & Kafka Monitoring Tool

This project provides a comprehensive setup for running Apache Kafka along with monitoring tools like Prometheus and Grafana within Docker containers. It's designed to offer a quick and straightforward way to deploy and monitor Kafka clusters, making it ideal for development, testing, and production environments.

## Features

- **Apache Kafka**: A distributed streaming platform that lets you publish and subscribe to streams of records.
- **Zookeeper**: Manages Kafka's cluster metadata and configurations.
- **Prometheus**: An open-source monitoring system with a dimensional data model, flexible query language, efficient time series database, and modern alerting approach.
- **Grafana**: An open-source platform for monitoring and observability, allowing you to visualize and alert on metrics and logs.

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- Docker
- Docker Compose

## Setup

1. Clone this repository to your local machine.

   ```bash
   git clone https://github.com/jathevan/Docker-Kafka-AND-Kafk-Monitoring-Tool.git
   ```

2. Navigate to the project directory.

   ```bash
   cd Docker-Kafka-AND-Kafk-Monitoring-Tool
   ```

3. Build the Docker images for the services by running:

   ```bash
   docker-compose build
   ```

4. Start the services using Docker Compose:

   ```bash
   docker-compose up -d
   ```

## Usage

- **Accessing Kafka**: Use Kafka's CLI tools or your preferred Kafka client to interact with the Kafka service running on `localhost:9092`.
- **Monitoring with Prometheus**: Access the Prometheus UI by navigating to `http://localhost:9090` on your web browser.
- **Visualizing with Grafana**: Access the Grafana dashboard by visiting `http://localhost:3000`. Default login credentials are admin/admin (username/password).

## Ports
The services in this project are mapped to the following ports:

- **Zookeeper**: 2181
- **Kafka**: 9092
- **Prometheus**: 9090
- **Grafana**: 3000

## Configuration

- **Kafka**: Configuration can be adjusted in the `docker-compose.yml` file under the Kafka service section.
- **Prometheus**: Modify `prometheus.yml` to change scraping intervals or add new targets.
- **Grafana**: Dashboards and data sources can be configured through the Grafana UI.


## Health Checks

In the context of Docker and Docker Compose, a `healthcheck` is a feature that allows you to define a command in your service configuration (usually within a `docker-compose.yml` file) that acts as a test or a probe to check the health of a service. This test is periodically executed by Docker to monitor the state of a service. Based on the outcome of the health check command (success or failure), Docker can determine whether a service is healthy, unhealthy, or in a starting state. This mechanism is crucial for maintaining the reliability and availability of services in a distributed system.

### Purpose of Health Checks

The primary purpose of implementing health checks in our Kafka & Kafka Monitoring Tool project is to ensure that each component of our system (Kafka, Zookeeper, Prometheus, Grafana) is running as expected and is able to serve requests. Health checks help in identifying issues early and can be used to automate recovery procedures, such as restarting a failed service or alerting the system administrator.

### Implementation in Our Project

- **Kafka and Zookeeper**: For services like Kafka and Zookeeper, which are critical for message streaming and coordination, the health check verifies the ability to connect to the respective ports (9092 for Kafka and 2181 for Zookeeper) and perform basic operations. This ensures that the services are not only up but are also responsive.

- **Prometheus**: For Prometheus, which is used for monitoring and alerting, the health check involves a simple test to confirm that the Prometheus server is up and reachable on its default port (9090). This is crucial for maintaining visibility into the health and performance of the entire system.

- **Grafana**: Grafana's health check confirms the availability of the Grafana dashboard on port 3000. This is important for ensuring that metrics and logs can be visualized and that the monitoring infrastructure is fully operational.

### Configuring Health Checks

Health checks are defined in the `docker-compose.yml` file under the `healthcheck` instruction for each service. Here is an example for the Grafana service:

```yaml
services:
  grafana:
    image: grafana/grafana
    healthcheck:
      test: ["CMD", "wget", "--quiet", "--tries=1", "--spider", "http://localhost:3000"]
      interval: 30s
      timeout: 10s
      retries: 3
```

This configuration instructs Docker to use `wget` to check the availability of Grafana's web interface every 30 seconds. If the check fails three times in a row (with a timeout of 10 seconds for each attempt), the service is marked as unhealthy.

By implementing health checks, we ensure that our Kafka & Kafka Monitoring Tool project remains robust and resilient, with automated mechanisms to detect and respond to issues in real-time.


## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any bugs, features, or improvements.

## License

This project is licensed under the MIT License - see the LICENSE file for details.


