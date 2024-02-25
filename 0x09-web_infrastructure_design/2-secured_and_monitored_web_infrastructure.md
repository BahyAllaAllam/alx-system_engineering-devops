# Secured and Monitored Web Infrastructure

![Image of a secured and monitored infrastructure](https://github.com/BahyAllaAllam/alx-system_engineering-devops/blob/main/0x09-web_infrastructure_design/2.%20Secured%20and%20monitored%20web%20infrastructure%20.png)

## Description

This is a 3-server web infrastructure that is secured, monitored, and serves encrypted traffic.

## Specifics About This Infrastructure

- **User wanting to access the website**: A user types "www.foobar.com" into their web browser.

- **Domain Name (www.foobar.com)**:
  - **DNS Record**: A DNS A record is configured for www.foobar.com pointing to the load balancer's IP address.

- **Load Balancer (LB)**:
  - **Role**: Distributes incoming traffic across multiple servers for load balancing and high availability.
  - **HTTPS Termination**: Terminates SSL/TLS encryption and forwards decrypted traffic to the web servers.
  - **SSL Certificate**: Installed on the load balancer to encrypt traffic between the user's browser and the load balancer.
  - **Firewall**: A firewall is placed in front of the load balancer to control and secure incoming traffic.

- **Web Servers (Server 1, Server 2, Server 3)**:
  - **Role**: Hosts the web application and serves HTTP/HTTPS requests.
  - **HTTPS Support**: Configured to handle encrypted HTTPS traffic from the load balancer.
  - **SSL Certificate**: Each web server is configured with the same SSL certificate to ensure secure communication with clients.
  - **Firewall**: Each web server is protected by its own firewall to control and secure incoming and outgoing traffic.

- **Application Servers (Server 1, Server 2, Server 3)**:
  - **Role**: Executes the application code, processes requests, and interacts with the database.
  - **Firewall**: Each application server is protected by its own firewall to control and secure incoming and outgoing traffic.

- **Database Servers (MySQL) (Server 1, Server 2, Server 3)**:
  - **Role**: Stores and manages the website's data.
  - **Replication**: Implement database replication to synchronize data between multiple database servers for fault tolerance and scalability.
  - **Firewall**: Each database server is protected by its own firewall to control and secure incoming and outgoing traffic.

- **Monitoring Clients**:
  - **Role**: Collects performance metrics, logs, and other data from the infrastructure for monitoring and troubleshooting purposes.
  - **Data Collection**: Sends collected data to a centralized monitoring platform (e.g., Sumo Logic) for analysis and visualization.
  - **Installed on each server** to gather server-specific metrics and logs.

## Issues With This Infrastructure

1. **Terminating SSL at the Load Balancer Level**: Terminating SSL/TLS encryption at the load balancer means that the traffic between the load balancer and the web servers is unencrypted. This could expose sensitive data if the internal network is compromised.

2. **Single MySQL Server Accepting Writes**: Having only one MySQL server capable of accepting write operations introduces a single point of failure. If this server goes down, write operations to the database will be unavailable, leading to downtime and potential data loss.

3. **Uniformity of Server Components**: Having servers with all the same components (database, web server, and application server) might lead to a lack of diversity in the infrastructure. If a vulnerability affects one component, it could potentially impact all servers in the infrastructure simultaneously.

## Recommendations

- **SSL Offloading**: Consider implementing SSL offloading at the load balancer level to reduce the risk of exposing sensitive data on the internal network.

- **MySQL Replication and Sharding**: Implement MySQL replication and sharding to distribute write operations across multiple database servers, improving fault tolerance and scalability.

- **Component Diversity**: Introduce diversity in server components by using different software versions or configurations to mitigate the impact of vulnerabilities affecting a single component.

By addressing these issues and implementing best practices for web infrastructure design, you can create a more secure, scalable, and resilient architecture for hosting www.foobar.com.
