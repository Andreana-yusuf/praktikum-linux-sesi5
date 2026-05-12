#!/bin/bash
awk -F, 'NR>1 {print tolower($6)}' data.csv | sort | uniq -c > output/soal1.txt
sed -E 's|([0-9]{2})/([0-9]{2})/([0-9]{4})|\3-\2-\1|g' data.csv | sed -E 's|([0-9]{2})-([0-9]{2})-([0-9]{2})|20\3-\2-\1|g' > output/soal2.csv
grep '@gmail.com' data.csv > output/gmail-customers.csv
awk -F, '!seen[$3]++' data.csv > output/soal4.csv
awk -F, 'NR>1 {if ($2 ~ /[a-z][A-Z]/ || $2 ~ /^[a-z]/) print $2}' data.csv | wc -l > output/soal5.txt
echo "[√] Solusi Exercise 1 Selesai!"
