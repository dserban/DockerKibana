```
docker run -d                              \
  --name=kibana                            \
  -p 7473:7473                             \
  -p 7474:7474                             \
  -p 7687:7687                             \
  -v /data/es:/work                        \
  -v /data/es/data:/opt/elasticsearch/data \
  -v /data/neo4j/data:/opt/neo4j/data      \
  -it dserban/dockerkibana
```
