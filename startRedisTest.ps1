echo "Running Redis"

docker-compose --file redis.yml up -d

echo "Waiting for 10 seconds before tests"
sleep 10

echo "Loading data into the Db"
cd ycsb-0.17.0
./bin/ycsb load redis  -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=6379" -p "redis.cluster=true" > ../results/redis_Load_output.txt
sleep 2
./bin/ycsb run redis  -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=6379" -p "redis.cluster=true" > ../results/redis_Run_output.txt

docker stop $(docker ps -a -q)
docker-compose -f redis.yml down
cd ..
Echo "End of Redis Test"