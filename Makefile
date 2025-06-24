.PHONY: up down rebuild lint test clean

ENV ?= vagrant

up:
    @./scripts/cluster.sh --up --env=$(ENV)

down:
    @./scripts/cluster.sh --down --env=$(ENV)

rebuild:
    @./scripts/cluster.sh --rebuild --env=$(ENV)

lint:
    ansible-lint playbooks/

test:
    ansible-playbook -i ansible/inventory/hosts.ini playbooks/site.yml --check

clean:
    find . -type f -name "*.retry" -delete
