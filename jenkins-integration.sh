#!/bin/bash
set -e

docker-compose build
echo ""
docker-compose up -d
echo ""

sleep 30

echo ""
mysql -u root -p"example" -h 127.0.0.1 -P3306 demodb < demodb.sql
echo ""

sleep 2

echo ""
docker exec liquibase liquibase update
echo ""
