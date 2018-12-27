#!/bin/bash
env
mkdir -p /mnt/vol/data
cd /mnt/vol/data
git clone https://github.com/padrian2s/dvc-mnist.git
cd dvc-mnist
ls -la
dvc pull -r myremote