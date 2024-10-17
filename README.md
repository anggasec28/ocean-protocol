<h2 align=center>OCEAN PROTOCOL</h2>

## **Specification**

- **RAM**: 2 GB
- **CPU**: 1 cores
- **Disk Space**: 4 GB




## Install & Run 1 Click
```
curl -O https://raw.githubusercontent.com/anggasec28/ocean-protocol/refs/heads/main/ocean.sh
## Check Eligibility Issue
```

## Eligibility Issue 
```
cd ocean && \
docker-compose down && \
docker-compose pull && \
docker-compose up -d && \
docker-compose logs -f
```


## Delete Node
```
cd ocean && \
docker-compose down && \
cd && \
rm -rf ocean && \
docker system prune -a && \
docker volume prune -f && \
docker network prune -f
```
