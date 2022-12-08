echo "Running orientDb"

docker-compose --file redis.yml up -d

echo "Waiting for 10 seconds before tests"
sleep 10

echo "Loading data into the Db"
cd ycsb-0.17.0
./bin/ycsb load redis  -s -P workloads/workloada -p orientdb.url=plocal:localhost:2480 -p orientdb.password=admin > ../results/redis_Load_output.txt
sleep 2
./bin/ycsb run redis  -s -P workloads/workloada -p orientdb.url=plocal:localhost:2480 -p orientdb.password=admin > ../results/redis_Run_output.txt

docker stop $(docker ps -a -q)
cd ..
docker-compose -f orientdb.yml down
Echo "End of Redis Test"