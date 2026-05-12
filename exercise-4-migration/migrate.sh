#!/bin/bash
cat produk-lama.csv | awk -F, 'NR>1 {print $1 "," tolower($2) "," $3}' > produk-bersih.csv
echo "[√] Solusi Exercise 4 Selesai!"
