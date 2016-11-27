```
docker run -d                              \
  --name=kibana                            \
  --net=host                               \
  -v /data/es:/work                        \
  -v /data/es/data:/opt/elasticsearch/data \
  -v /data/neo4j/data:/opt/neo4j/data      \
  -it dserban/dockerkibana
```
