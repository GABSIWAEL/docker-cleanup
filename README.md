# Docker Cleanup Script

A simple Bash script to clean up Docker on a VPS or server.
It helps free space by removing unused containers, images, and build caches while keeping your volumes safe.

## Features

- Stop and remove exited containers
- Remove dangling images
- Remove Docker build cache
- Prune everything except volumes
- Show reclaimed space and current disk usage

## Usage

1. Make the script executable:

```bash
chmod +x docker-cleanup.sh
```

2. Run the script with sudo:

```bash
sudo ./docker-cleanup.sh
```

> **Note:** `sudo` is required to remove Docker containers and images.

## Example Output

```text
Starting Docker cleanup...
Stopping exited containers...
Removing stopped containers...
Removing dangling images...
Deleted: sha256:c28ba2b34c5f...
Deleted: sha256:4dee6df340a7...
Removing build cache...
Pruning everything except volumes...
Total reclaimed space: 0B
Docker cleanup complete!
Filesystem      Size  Used Avail Use% Mounted on
udev            3.8G     0  3.8G   0% /dev
tmpfs           776M  3.2M  773M   1% /run
/dev/sda1        74G   14G   57G  20% /
...
```

## Notes

- The script keeps Docker volumes intact to avoid deleting important data.
- You can schedule it with `cron` for automatic cleanup.

## License

This script is open source and free to use.
