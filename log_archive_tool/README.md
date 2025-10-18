# log-archive

## Getting Started

1. **Clone Repo**

```
git clone https://github.com/RahulLulla/devops-labs.git
cd log_archive_tool
```

2. **Make Script executable and run it**

```
chmod +x log-archive
mv log-archive /usr/local/bin/
log-archive
```

## Usage

Usage: log_archive_tool -l <log_directory_to_compress> -a <archive_directory_path> [-d] [-s]
-l : Directory containing logs to compress
-a : Directory where the archive should be stored
-d : Delete original logs after archiving (optional)
-s : Schedule daily archiving at noon using cron (optional)
Example: log_archive_tool -l /var/log/myapp -a /var/archives -d -s

Project URL:
https://roadmap.sh/projects/log-archive-tool