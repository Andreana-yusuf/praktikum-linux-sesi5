#!/bin/bash
sudo apt-get install jq -y &>/dev/null
jq -r '[.customer.id, .total] | @tsv' orders.jsonl | awk '{sum[$1]+=$2} END {for(c in sum) print sum[c], c}'
echo "[√] Solusi Exercise 3 Selesai!"
