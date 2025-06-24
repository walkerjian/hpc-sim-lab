#!/bin/bash
set -e

case "$1" in
  up)
    echo "[docker.sh] Bringing up Docker sim lab..."
    docker compose -f container/docker-compose.yml up -d
    ;;

  down)
    echo "[docker.sh] Tearing down Docker sim lab..."
    docker compose -f container/docker-compose.yml down
    ;;

  rebuild)
    echo "[docker.sh] Rebuilding and restarting Docker sim lab..."
    docker compose -f container/docker-compose.yml down
    docker compose -f container/docker-compose.yml up --build -d
    ;;

  *)
    echo "[docker.sh] Usage: $0 {up|down|rebuild}"
    exit 1
    ;;
esac
