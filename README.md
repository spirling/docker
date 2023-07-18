# Instructions

Before running containers you should create SSL certificate with the script:

```bash
sudo ./scripts/ssl-create-spirling.sh
```

### Commands

- Build and start containers:
```bash
docker-compose up --build -d 
```
- Stop and remove containers:
```bash
docker-compose down --remove-orphans
```