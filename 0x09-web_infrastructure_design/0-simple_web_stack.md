# Simple Web Stack

![Image of a secured and monitored infrastructure](https://github.com/BahyAllaAllam/alx-system_engineering-devops/blob/main/0x09-web_infrastructure_design/0.%20Simple%20web%20stack%20.png)

## Description

This is a simple web infrastructure that hosts a website reachable via www.foobar.com. There are no firewalls or SSL certificates for protecting the server's network. Each component (database, application server) has to share the resources (CPU, RAM, and SSD) provided by the server.

## Specifics About This Infrastructure

- **User wanting to access the website**: A user types "www.foobar.com" into their web browser.

- **Domain Name (www.foobar.com)**: This is the human-readable name used to access the website. The domain name is associated with the IP address of the server hosting the website (e.g., 8.8.8.8). The "www" in "www.foobar.com" is a subdomain typically used to denote the web server.
  - **DNS Record**: A DNS A record is configured for www.foobar.com pointing to the server's IP address (8.8.8.8).

- **Server (8.8.8.8)**: This is a physical or virtual machine responsible for hosting the website and serving web pages to users. It runs the necessary software components to handle incoming requests.
  - **Role of the Server**: The server hosts the web server, application server, and database.

- **Web Server (Nginx)**: Nginx is a popular web server software that handles incoming HTTP requests from clients and serves static files or routes requests to the application server for dynamic content generation.
  - **Role of the Web Server**: Nginx serves as the entry point for incoming HTTP requests, handling tasks such as SSL termination, load balancing, and serving static content efficiently.

- **Application Server**: This is where the application code is deployed and executed. It handles dynamic content generation, interacts with the database, and performs business logic.
  - **Role of the Application Server**: The application server executes the application code, processes requests, and generates dynamic content based on user input or database queries.

- **Application Files (Your Code Base)**: This includes the source code, libraries, and dependencies required to run the website's application logic.

- **Database (MySQL)**: MySQL is a relational database management system used for storing and retrieving data required by the application.
  - **Role of the Database**: MySQL stores structured data such as user accounts, product information, or other application-specific data.

- **Communication with User's Computer**: When a user requests the website, their computer sends an HTTP request to the server's IP address (8.8.8.8). The request is processed by the web server (Nginx), which may pass it to the application server for dynamic content generation. The application server interacts with the database as needed and sends the response back to the user's computer via HTTP.

## Issues With This Infrastructure

1. **Single Point of Failure (SPOF)**: Since there's only one server hosting the entire infrastructure, any failure in hardware, software, or network connectivity could result in downtime for the website.

2. **Downtime During Maintenance**: Performing maintenance tasks such as deploying new code or updates may require restarting the web server (Nginx), resulting in downtime for the website during the maintenance window.

3. **Limited Scalability**: With only one server, the infrastructure cannot easily handle a large influx of incoming traffic. Scaling up resources (such as CPU, memory, or bandwidth) on a single server may have limitations and could lead to performance issues under heavy load.
