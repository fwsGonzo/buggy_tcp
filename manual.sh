#!/bin/bash
echo "Sending to IncludeOS"
cat > /dev/tcp/10.0.0.59/666 < ./big.elf
echo "Sending to Linux"
cat > /dev/tcp/10.0.0.1/1666 < ./big.elf
