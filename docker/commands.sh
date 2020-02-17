
docker service scale ruthgx=5
docker service ps ruthgx
docker service update --replicas 10 ruthgx
docker network ls
docker service rm ruthgx
docker service ls
docker network create -d overlay ntwrk1
docker service create --name ruthgxx --network ntwrk1 -p 80:80 nginx
docker service inspect --pretty ruthgx
docker service create --name vote -p 8080:80 --network ntwrk1 --replicas 12 nigelpoulton/tu-demo:v1
docker service update --image nigelpoulton/tu-demo:v2 --update-parallelism 2 --update-dely 10s vote


