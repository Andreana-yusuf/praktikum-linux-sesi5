#!/bin/bash
awk '{print $1}' access.log | sort | uniq -c | sort -rn | head -n 10
echo "[√] Solusi Exercise 2 Selesai!"
