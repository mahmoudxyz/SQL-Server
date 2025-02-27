FROM mcr.microsoft.com/mssql/server:2019-latest

# Set environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=pass-for-test

# Copy SSL certificate and configuration script
COPY sqlserver-cert.pfx /var/opt/mssql/
COPY configure-ssl.sh /usr/local/bin/configure-ssl.sh

# Make the script executable
RUN chmod +x /usr/local/bin/configure-ssl.sh

# Expose SQL Server port
EXPOSE 1433

# Configure SQL Server to use SSL
ENTRYPOINT ["/bin/bash", "/usr/local/bin/configure-ssl.sh"]
