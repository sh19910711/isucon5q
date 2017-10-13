deploy:
	sh deploy.sh

alp: # nginxログ集計
	cat /tmp/nginx/access_log.ltsv | docker exec -i analysis alp -r --cnt | head -10

pt-query-digest: # スローログ集計
	cat /tmp/mysqld-slow.log | docker exec -i analysis pt-query-digest

benchmark: # benchディレクトリと被るので
	cd bench && jq '.[0]' < ../test/testsets.json | gradle -q run | ruby -rjson -r../lib/score -e "r=JSON.parse(STDIN.read);puts Isucon5Portal::Score.calculate(r);puts r['responses'];r['violations'].each{|v| puts v['description']}"

analysis:
	docker run --rm -ti --name analysis analysis bash
