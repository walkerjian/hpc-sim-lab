# Contributing to HPC Sim Lab

Thanks for contributing! Here’s how to get started:

## Setup

1. Clone the repo
2. Run `pip install -r requirements.txt`
3. Copy `.env.template` to `.env` and adjust as needed
4. Use `make up` or `./scripts/cluster.sh --up --env=vagrant`

## Guidelines

- Branch off `main` (e.g., `feature/slurm-ansible`)
- Write clear commits: `git commit -m "Add Prometheus role with Grafana export"`
- Run `make lint` before PRs to ensure clean YAML and playbooks
- Keep VMs clean: teardown with `make down` before testing another env
- Check CI logs on PRs: we lint and dry-run every role

## Helpful Scripts

- `cluster.sh`: boot and tear down environments
- `vagrant.sh`, `docker.sh`: environment-specific helpers

Happy hacking!
