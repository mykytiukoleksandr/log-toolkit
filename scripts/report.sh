#!/bin/bash
mkdir -p reports

echo "=== 1. Total requests ===" > reports/summary.txt
cat logs/access.log | wc -l >> reports/summary.txt

echo "" >> reports/summary.txt
echo "=== 2. Requests per IP ===" >> reports/summary.txt
cut -d' ' -f3 logs/access.log | sort | uniq -c | sort -rn >> reports/summary.txt

echo "" >> reports/summary.txt
echo "=== 3. Status per request ===" >> reports/summary.txt
cut -d' ' -f6 logs/access.log | sort | uniq -c | sort -rn >> reports/summary.txt

echo "" >> reports/summary.txt
echo "=== 4. Requests witch not 200 ===" >> reports/summary.txt
cut -d' ' -f6 logs/access.log | grep -v 200 | wc -l

echo "" >> reports/summary.txt
echo "=== 5. Request with error 500 ===" >> reports/summary.txt
grep 500 logs/access.log

echo "" >> reports/summary.txt
echo "=== 6. Most popular path ===" >> reports/summary.txt
cut -d' ' -f5 logs/access.log | sort | uniq -c | sort -rn | head -n 1

echo "" >> reports/summary.txt
echo "=== 7. Which IP get 403 ===" >> reports/summary.txt
grep 403 logs/access.log | cut -d' ' -f3
