echo "Running mongo"

docker-compose --file mongodb.yml up -d

echo "Waiting for 10 seconds"
sleep 10

echo "Starting Configuration"
docker exec -t -i mongo1 /bin/bash /rs-init.sh

echo "Waiting for 5 seconds before tests"
sleep 5

echo "Loading data into the Db"
cd ycsb-0.17.0
./bin/ycsb load mongodb -s -P workloads/workloada -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 > ../results/mongo_Load_output.txt
sleep 2
./bin/ycsb run mongodb -s -P workloads/workloada -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 > ../results/mongo_Run_output.txt

docker stop $(docker ps -a -q)
cd ..
docker-compose -f mongodb.yml down
Echo "End of Mongo Test"