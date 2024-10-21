#!/bin/bash
cd cluster1
docker-compose down
docker-compose up -d --build
cd ..
clear
echo "Salve no bloco de notas o ip do cluster web abaixo: "
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster1-web-1
sleep 10;
vim cluster2/dns_server/db.example.com
cd cluster2
docker-compose down
docker-compose up -d --build
clear
echo "Salve no bloco de notas o ip do cluster dns abaixo: "
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' cluster2-dns
docker-compose down
vim cluster2/dns_server/db.example.com
docker-compose up -d --build
clear
cd ..
rm install.sh
