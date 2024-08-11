#!/usr/bin/bash
set -euo pipefail

lscpu | grep "Model name:"
lscpu | grep "Core(s)"
