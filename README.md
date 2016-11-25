```
docker run          \
  --rm              \
  --name=kibana     \
  --net=host        \
  -v /data/es:/work \
  -it dserban/dockerkibana
```
