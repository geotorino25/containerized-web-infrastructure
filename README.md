# Containerized Web Infrastructure

## Project Description

This project deploys a WordPress website and MySQL
database using Docker and Docker Compose on Ubuntu Server.

## Technologies Used

- Ubuntu Server
- Docker Engine
- Docker Compose
- WordPress
- MySQL 8.4
- Bash
- Cron
- UFW
- GitHub

## Project Architecture

WordPress runs inside a Docker container and connects
to MySQL through a private Docker network.

## Website Access

http://YOUR-UBUNTU-IP:8080

## Deployment Commands

docker compose config
docker compose up -d
docker compose ps

## Backup

Run:

./backup.sh

## Maintenance

docker compose restart
docker compose logs --tail 50
docker compose stop
docker compose start
