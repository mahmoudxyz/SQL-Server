#!/bin/bash

# Ensure SQL Server is running
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
sleep 30s

# Configure SSL
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'pass-for-test' -Q "CREATE LOGIN [ssl_login] FROM CERTIFICATE [ssl_cert]"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'pass-for-test' -Q "ALTER SERVER CONFIGURATION SET ENCRYPTION = ON;"

# Stop SQL Server
pkill sqlservr