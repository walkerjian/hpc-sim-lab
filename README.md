# HPC Simulation Lab

![CI](https://github.com/walkerjian/hpc-sim-lab/actions/workflows/ci.yml/badge.svg)

A portable, teardown-friendly HPC training environment with SLURM, Prometheus, Ansible, and optional NVIDIA stack support. Designed for Vagrant, Docker, or Hyper-V.

## Quick Start
```bash
./scripts/cluster.sh --up --env=vagrant
./scripts/cluster.sh --down
```

## Structure
- `ansible/`: Automation for SLURM, monitoring, node config
- `vagrant/`, `container/`, `scripts/`: Platform-specific deployment


# Trigger for Docker CI only
