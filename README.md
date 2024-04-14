# Kafka Docker Project

This project sets up a Kafka and Zookeeper service using Docker and Docker Compose.

## Prerequisites

- Docker
- Docker Compose

## Services

This project includes the following services:

- **Zookeeper**: This service is used by Kafka for leader election of Kafka Brokers and topic replica sets. The Zookeeper service is built from the `bitnami/zookeeper:latest` Docker image.

- **Kafka**: This service is used to build real-time data pipelines and streaming apps. It is horizontally scalable, fault-tolerant, and incredibly fast. The Kafka service is built from the `bitnami/kafka:latest` Docker image.

## Setup

1. Clone this repository to your local machine.

2. Navigate to the project directory.

3. Build the Docker images for the services by running the following command:

```bash
docker-compose build
```

## Ports

The services in this project are mapped to the following ports:

- **Zookeeper**: 2182
- **Kafka**: 9092

## Volumes

The services in this project use the following Docker volumes for data persistence:

- **Zookeeper**: `zookeeper_data`
- **Kafka**: `kafka_data`

## Health Checks

The Zookeeper service includes a health check that tests the connection to port 2181 every 10 seconds, with a timeout of 5 seconds and a maximum of 5 retries.