#!/bin/bash

# Start Munge with log to stderr and proper user
echo "🔐 Starting munged..."
su -s /bin/bash munge -c "/usr/sbin/munged --syslog"

sleep 1

# Start SLURM controller or daemon
if [[ "$HOSTNAME" == *"controller"* ]]; then
    echo "🧠 Starting slurmctld..."
    /usr/sbin/slurmctld
else
    echo "🧱 Starting slurmd..."
    /usr/sbin/slurmd
fi

# Keep container alive
exec tail -f /dev/null
