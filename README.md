# log-toolkit

Small Bash toolkit that analyzes a web server access log.

## What it does
Reads `logs/access.log` and writes a summary report: total requests,
requests per IP, status code counts, errors, most requested path, and
IPs that received 403.

## Structure
- `logs/` - sample access log
- `scripts/report.sh` - report script
- `reports/` - generated output (not tracked by Git)

## How to run
```
./scripts/report.sh
cat reports/summary.txt
```

## Example output
=== 2. Requests per IP ===
      5 192.168.1.10
      4 192.168.1.11
      3 192.168.1.14
      3 192.168.1.12
      3 10.0.0.5
      2 192.168.1.13
