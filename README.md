# HPC Simulation Lab

![Docker CI](https://github.com/walkerjian/hpc-sim-lab/actions/workflows/docker-check.yml/badge.svg)


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

Ohhh Joseph, this is absolute catnip — you’ve gone from container necromancer to aspiring cluster overlord, and now we get to make it *repeatable*, *documented*, and *educational*. I love it.

---

## 📘 `README.md` Log: The Full-Fat SLURM Boot Log (CliffsNotes Edition)

Here’s a clean, copy-pasteable summary for your `README.md` or a GitHub Gist:

---

### 🧠 HPC Sim Lab: Full-Fat SLURM Cluster in Docker

**Branch**: `feature/full-fat-cluster`  
**Purpose**: Containerized SLURM setup for realistic HPC simulation and testing — complete with controller + 2 compute nodes, fully job-capable.

---

### ⚙️ Prerequisites

- Docker (Engine + Compose)
- At least 3–4GB free RAM, but Stan thrives with 16+  
- Ubuntu-based dev environment recommended for CLI parity

---

### 🛠️ Boot Sequence

```bash
# From project root
docker compose -f container/docker-compose.yml up --build -d
```

This launches:
- `slurm-controller`
- `slurm-compute1`
- `slurm-compute2`

All containers mount `container/slurm/` and start:
- `munge`
- `slurmctld` (controller)
- `slurmd` (compute nodes)

---

### 🧪 Test the Cluster

```bash
docker exec -it slurm-controller bash

# Inside container:
sinfo           # View cluster state
srun hostname   # Run job across compute nodes
```

You should see both compute nodes in `idle` state and job results like `compute1`.

---

### 💀 Tear It Down Cleanly

```bash
docker compose -f container/docker-compose.yml down
```

All containers and networks go poof.

---

### 🧼 Keeping It Sanitary

- Containers are **ephemeral**, but logs, spool, and jobs go into `/var/spool/slurm`.
- You can mount a host volume or named volume for **state persistence** later:
  ```yaml
  volumes:
    - slurm-state:/var/spool/slurm
  ```
- For complete teardown:
  ```bash
  docker system prune --volumes
  ```

---

### 🧃 Future Roadmap Ideas

- [ ] Run real compiled Fortran/MPI jobs (can cross-compile & mount executable)
- [ ] Submit `sbatch` jobs for long-queue testing
- [ ] Monitor with Prometheus/Grafana
- [ ] CI workflows that simulate job load
- [ ] SSH between nodes with shared user/key setup
- [ ] Persistent storage for `/etc/slurm`, Munge key, and job output

---

## 🌱 Want This as a Gist?

I can absolutely push this into a markdown snippet for you. Would you like:

- A tidy **GitHub Gist** you can share or embed?
- Or a `README.md` stub to commit right now into the branch?

And after that: Fortran + SLURM jobs, simultaneous job class tests, and cluster admin rituals? Bring it. We’ll compile something so crunchy it’ll stress-test your RAM and your soul in equal measure.
