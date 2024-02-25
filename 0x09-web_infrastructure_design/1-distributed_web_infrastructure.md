# Distributed Web Infrastructure

![Image of a secured and monitored infrastructure](https://github.com/BahyAllaAllam/alx-system_engineering-devops/blob/main/0x09-web_infrastructure_design/1.%20Distributed%20web%20infrastructure%20.png)

## Description

This is a distributed web infrastructure that attempts to reduce the traffic to the primary server by distributing some of the load to a replica server with the aid of a server responsible for balancing the load between the two servers (primary and replica).

## Specifics About This Infrastructure

- **User wanting to access the website**: A user types "www.foobar.com" into their web browser.

- **Domain Name (www.foobar.com)**:
    - **DNS Record**: A DNS A record is configured for www.foobar.com pointing to the load balancer's IP address.

- **Load Balancer (HAProxy)**:
    - **Role**: Distributes incoming traffic across multiple servers for load balancing and high availability.
    - **Distribution Algorithm**: Configured with a round-robin distribution algorithm, which evenly distributes incoming requests among the available servers.
    - **Active-Passive Setup**: The load balancer is configured in an Active-Passive setup, where only one load balancer node is active at a time. The passive node acts as a standby backup and takes over if the active node fails.

- **Web Server**:
    - **Role**: Hosts the web application and serves HTTP requests.
    - **Web Server Software**: Nginx is used as the web server software.
    - **Application Files**: Hosts the application codebase and serves static content.

- **Application Server**:
    - **Role**: Executes the application code, processes requests, and interacts with the database.
    - **Application Logic**: Implements the business logic of the website, handles user authentication, data processing, etc.

- **Database (MySQL)**:
    - **Role**: Stores and manages the website's data.
    - **Primary-Replica Cluster**: Configured as a Primary-Replica (Master-Slave) cluster, where one node acts as the primary (master) and the others as replicas (slaves).
    - **Replication**: The primary node replicates data changes to the replica nodes to ensure data consistency and fault tolerance.

## Issues With This Infrastructure

1. **Single Point of Failure (SPOF)**:
    - The Active-Passive setup of the load balancer introduces a single point of failure. If the active load balancer node fails, there will be downtime until the passive node takes over.
    - Lack of redundancy in the web server and application server components also introduces a single point of failure. If either server fails, the website will become unavailable.

2. **Security Issues**:
    - Lack of firewall: Without a firewall, the infrastructure is vulnerable to unauthorized access, DDoS attacks, and other security threats.
    - No HTTPS: Serving traffic over HTTP instead of HTTPS exposes sensitive user data to potential eavesdropping and interception.

3. **No Monitoring**:
    - Without monitoring, there is limited visibility into the health, performance, and security of the infrastructure. This makes it difficult to detect and troubleshoot issues in real-time.
