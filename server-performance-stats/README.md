# Server Performance Stats

Small shell script that prints:

- total CPU usage
- total memory usage with free/used and percentages
- total disk usage with free/used and percentages
- top 5 processes by CPU usage
- top 5 processes by memory usage

## Run

```bash
chmod +x server-performance-stats.sh
./server-performance-stats.sh
```

## Notes

- This version is written for macOS.
- It uses `top`, `sysctl`, `vm_stat`, `df`, `ps`, `sort`, `head`, and `awk`.

Project URL: https://roadmap.sh/projects/server-stats