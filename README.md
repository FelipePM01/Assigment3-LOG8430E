# Assigment3-LOG8430E

To run this assignement we start by putting depending on the Db 

MongoDb : mongodb.yml and rs-init.sh and startMongoTest.ps1 in the same path as the ycsb-0.17.0 folder we will try to access using cd ycsb-0.17.0 

So we should be having the folder ycsb-0.17.0 in the same place as our files.

OrientDb : put on the same folder as ycsb-0.17.0 orientDb.yml and StartOrientDbTest.ps1

Redis : put on the same folder as ycsb-0.17.0 redis.yml and StartRedisTest.ps1


The scripts will only run for workloadA to not make it long you can change the command to take worloadB or C.

The script will Spawn a Db cluster configure it and run the Load command to load records on the db. Run the workload Test after that and finally clean up.
