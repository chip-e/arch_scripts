#!/usr/bin/bash
set -euo pipefail
# Displays Systems and hardware info
# WIP

# kernel and system architecture
kernel=$(uname -a | awk {'print $2 " "  $NF'})
echo "Kernel: $kernel"

# distro
# distro=$(head -n1 /etc/issue)
# distro=$(cat /etc/*-release | grep "NAME" | awk {'print $2'})
distro=$(cat /etc/*-release | grep "NAME")
echo "Distribution: $distro"
# cpu info
cpuname=$(lscpu | grep "Model name:")
cpucores=$(lscpu | grep "Core(s)")
# ram
ram=$(grep MemTotal /proc/meminfo)

