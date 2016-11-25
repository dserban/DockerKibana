```
docker run -d                              \
  --name=kibana                            \
  --net=host                               \
  -v /data/es:/work                        \
  -v /data/es/data:/opt/elasticsearch/data \
  -it dserban/dockerkibana
```
