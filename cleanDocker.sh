# cleaning docker space
df
docker stop $(docker ps -a -q)
docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
docker rm -v $(docker ps -a -q -f status=exited)
df
