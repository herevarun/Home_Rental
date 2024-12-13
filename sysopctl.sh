#!/bin/bash

# Define functions for each operation

# List running services
service_list() {
    systemctl list-units --type=service --state=active --no-pager
}

# View system load
system_load() {
    uptime | awk -F'load average:' '{ print $2 }'
}

# Start a service
service_start() {
    if [ -z "$1" ]; then
        echo "Please specify a service name."
        return
    fi
    sudo systemctl start "$1" && echo "Service $1 started successfully" || echo "Failed to start service $1"
}

# Stop a service
service_stop() {
    if [ -z "$1" ]; then
        echo "Please specify a service name."
        return
    fi
    sudo systemctl stop "$1" && echo "Service $1 stopped successfully" || echo "Failed to stop service $1"
}

# Check disk usage
disk_usage() {
    df -h
}

# Monitor system processes
process_monitor() {
    ps aux --sort=-%cpu | head -n 10  # Display top 10 CPU-consuming processes
}

# Analyze system logs
logs_analyze() {
    journalctl -p 3 -n 20 --no-pager
}

# Backup system files
backup_system() {
    if [ -z "$1" ]; then
        echo "Please specify a directory to back up."
        return
    fi
    if [ ! -d "$1" ]; then
        echo "Source directory does not exist."
        return
    fi
    rsync -av --progress "$1" /path/to/backup/destination/
    echo "Backup of $1 initiated."
}

# Command-line interface (CLI) options
case "$1" in
    service)
        case "$2" in
            list) service_list ;;
            start) service_start "$3" ;;
            stop) service_stop "$3" ;;
            *) echo "Invalid service command. Usage: service {list|start|stop}" ;;
        esac
        ;;
    system)
        case "$2" in
            load) system_load ;;
            *) echo "Invalid system command. Usage: system {load}" ;;
        esac
        ;;
    disk)
        case "$2" in
            usage) disk_usage ;;
            *) echo "Invalid disk command. Usage: disk {usage}" ;;
        esac
        ;;
    process)
        case "$2" in
            monitor) process_monitor ;;
            *) echo "Invalid process command. Usage: process {monitor}" ;;
        esac
        ;;
    logs)
        case "$2" in
            analyze) logs_analyze ;;
            *) echo "Invalid logs command. Usage: logs {analyze}" ;;
        esac
        ;;
    backup)
        backup_system "$2" ;;
    --help)
        echo "Usage: sysopctl [command] [options]"
        echo "Commands:"
        echo "  service list                  - List running services"
        echo "  service start <service-name>  - Start a service"
        echo "  service stop <service-name>   - Stop a service"
        echo "  system load                   - View system load"
        echo "  disk usage                    - Check disk usage"
        echo "  process monitor               - Monitor system processes"
        echo "  logs analyze                  - Analyze system logs"
        echo "  backup <path>                 - Backup system files"
        ;;
    --version)
        echo "sysopctl v0.1.0"
        ;;
    *)
        echo "Invalid command. Use '--help' for usage information."
        ;;
esac
