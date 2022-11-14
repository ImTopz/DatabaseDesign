docker run \
-e "ACCEPT_EULA=1" \
-e "MSSQL_SA_PASSWORD=zd521..$$" \
-e "MSSQL_PID=Developer" \
-e "MSSQL_USER=zder" \
-p 1433:1433 \
-d --name=sqlServer \
mcr.microsoft.com/azure-sql-edge
