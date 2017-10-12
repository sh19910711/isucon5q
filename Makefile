deploy:
	sh deploy.sh

pt-query-digest:
	cat /tmp/mysqld-slow.log | docker exec -i analysis pt-query-digest
