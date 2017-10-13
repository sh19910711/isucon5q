sudo echo hello isucon

cp config/my.cnf /usr/local/etc/my.cnf
pkill mysqld
mysqld &

cp config/nginx.conf /usr/local/etc/nginx/nginx.conf
sudo pkill nginx
sudo nginx &
