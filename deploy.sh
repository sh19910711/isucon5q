sudo echo hello isucon

-- mysql
mkdir -p /tmp/mysql
cp config/my.cnf /usr/local/etc/my.cnf
pkill mysqld
mysqld &

-- nginx
mkdir -p /tmp/nginx
cp config/nginx.conf /usr/local/etc/nginx/nginx.conf
sudo pkill nginx
sudo nginx &

-- webapp
pushd ruby
pkill ruby
bundle install -j4
RACK_ENV=production bundle exec rackup --host localhost --port 8080 &
popd

echo finished
