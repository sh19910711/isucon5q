deploy:
	sh deploy.sh

pt-query-digest: # スローログ集計
	cat /tmp/mysqld-slow.log | docker exec -i analysis pt-query-digest

benchmark: # benchディレクトリと被るので
	cd bench && jq '.[0]' < ../test/testsets.json | gradle -q run | ruby -rjson -r../lib/score -e "r=JSON.parse(STDIN.read);puts Isucon5Portal::Score.calculate(r);puts r['responses'];r['violations'].each{|v| puts v['description']}"
