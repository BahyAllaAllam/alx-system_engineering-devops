# Scaled Up Web Infrastructure

![Image of a scaled up web infrastructure]([3-scale_up.png](https://github.com/BahyAllaAllam/alx-system_engineering-devops/blob/main/0x09-web_infrastructure_design/3-scale_up.png))

## Description

This web infrastructure is a scaled up version of the infrastructure described [here](2-secured_and_monitored_web_infrastructure.md). In this version, all SPOFs have been removed, and each of the major components (web server, application server, and database servers) have been moved to separate GNU/Linux servers. The SSL protection isn't terminated at the load-balancer, and each server's network is protected with a firewall, and they're also monitored.

## Specifics About This Infrastructure

- **User wanting to access the website**: A user types "www.foobar.com" into their web browser.

- **Domain Name (www.foobar.com)**:
    - **DNS Record**: A DNS A record is configured for www.foobar.com pointing to the IP address of the load balancer cluster.

- **Load Balancer Cluster (HAProxy)**:
    - **Role**: Distributes incoming traffic across multiple servers for load balancing and high availability.
    - **Cluster Configuration**: HAProxy is configured as a cluster with two instances for redundancy and fault tolerance.

- **Web Server**:
    - **Role**: Hosts the web application and serves HTTP requests.
    - **Reason for Separation**: Separating the web server from the application server allows for better resource allocation and scalability. It also improves security by isolating the web-facing components from the application logic and database.

- **Application Server**:
    - **Role**: Executes the application code, processes requests, and interacts with the database.
    - **Reason for Separation**: Separating the application server from the web server allows for better resource allocation and scalability. It also improves security by isolating the application logic and database interactions from the web-facing components.

- **Database Server (MySQL)**:
    - **Role**: Stores and manages the website's data.
    - **Reason for Separation**: Separating the database server from the application server improves security by isolating sensitive data and database operations. It also allows for better resource allocation and scalability.

By separating the components into their own servers and configuring HAProxy as a cluster, we achieve:

- **Redundancy and High Availability**: The load balancer cluster provides redundancy and fault tolerance. If one instance fails, the other can continue to handle incoming traffic seamlessly, ensuring high availability of the website.

- **Scalability**: Separating the components allows for better scalability. Additional servers can be added for each component as needed to handle increased traffic and workload.

- **Isolation and Security**: Separating the components improves security by isolating different layers of the application stack. It reduces the attack surface and minimizes the impact of security breaches or vulnerabilities in one component on the others.

## Issues With This Infrastructure

+ High maintenance costs.<br/>Moving each of the major components to its own server, means that more servers would have to be bought and the company's electricity bill would rise along with the introduction of new servers. Some of the company's funds would have to be used to buy the servers and pay for the electricity consumption needed to keep the servers (including the new and old ones) running.
