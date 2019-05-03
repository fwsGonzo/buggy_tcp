#!/bin/bash
fallocate -l 35741088 zeroes.elf
echo "Sending to IncludeOS"
cat > /dev/tcp/10.0.0.59/666 < ./zeroes.elf
echo "Sending to Linux"
cat > /dev/tcp/10.0.0.1/1666 < ./zeroes.elf
