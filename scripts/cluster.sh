#!/bin/bash
set -e

usage() {
  echo "Usage: $0 [--up|--down|--rebuild] --env=[vagrant|docker|hyperv]"
  exit 1
}

# Default env
ENV="vagrant"

for arg in "$@"; do
  case $arg in
    --up) ACTION="up" ;;
    --down) ACTION="down" ;;
    --rebuild) ACTION="rebuild" ;;
    --env=*) ENV="${arg#*=}" ;;
    *) usage ;;
  esac
done

[ -z "$ACTION" ] && usage

case $ENV in
  vagrant) bash scripts/vagrant.sh "$ACTION" ;;
  docker) bash scripts/docker.sh "$ACTION" ;;
  hyperv) pwsh scripts/hyperv.ps1 "$ACTION" ;;
  *) echo "Unknown env: $ENV" && usage ;;
esac
