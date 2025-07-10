# Airflow on Kubernetes

This project provides a complete setup for deploying a scalable Apache Airflow instance in a Kubernetes cluster, using the CeleryExecutor.

This configuration is designed for production-grade workloads and includes:

- PostgreSQL for the Airflow metadata database.

- Redis as the Celery message broker.

- Airflow Webserver, Scheduler, and API Server deployments.

- A scalable pool of Airflow Celery Workers.

- A shared Persistent Volume for DAG management.
## Architecture Overview

This setup uses the CeleryExecutor, which allows for scaling tasks across multiple worker pods.

- The Scheduler monitors for new DAG runs and tasks.

- When a task is ready to run, the Scheduler sends a message to the Redis message broker.

- An available Celery Worker picks up the task from the queue and executes it.

- The Webserver provides the user interface for monitoring and managing DAGs.

- The PostgreSQL database stores all Airflow metadata, including DAG structures, task states, and connections.

## Technology Stack

* **Orchestration:** Apache Airflow (running on Kubernetes)
* **Executor:** CeleryExecutor
* **Primary Operator:** `KubernetesPodOperator`
* **Language:** Python 3.12
* **DAG Deployment:** Imagepull method