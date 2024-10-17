<h2 align=center>OCEAN PROTOCOL</h2>

## **Specification**

- **RAM**: 2 GB
- **CPU**: 1 cores
- **Disk Space**: 4 GB

## Check Node
Tampilan Jika node sudah run dan sukses accept block 

https://nodes.oceanprotocol.com ( Paste IP Vps )
![IMG_4716](https://github.com/user-attachments/assets/08ac6fa6-9af0-4c60-9023-3ce7c4e5f82e)

## Install & Run 1 Click
```
bash <(curl -s https://raw.githubusercontent.com/anggasec28/ocean-protocol/refs/heads/main/ocean.sh)
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
