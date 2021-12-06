border="================================================================================"
# add list of services as space separated values in the below variable.
services="ufw ssh mongod mssql-server redis postgresql"
for service in $services
do
	echo $border
	sudo systemctl status $service --no-pager
	echo $border
done