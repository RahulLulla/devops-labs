#!/bin/bash
echo "=============================="
echo "Server Performance Stats"
echo "=============================="

echo "Total CPU Usage:" $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
echo ""

total=$(free -m | awk '/Mem:/ {print $2}')
used=$(free -m | awk '/Mem:/ {print $3}')
free=$(free -m | awk '/Mem:/ {print $4}')
echo "Total Memory: $total MB"
echo "Free: $free MB" 
echo "Free(%):" $(echo "scale=2; $free / $total * 100" | bc -l)"%"
echo "Used: $used MB" 
echo "Used(%): " $(echo "scale=2; $used / $total * 100" | bc -l)"%"
echo ""


total=$(df -m --total | awk '/total/ {print $2}')
used=$(df -m --total | awk '/total/ {print $3}')
free=$(df -m --total | awk '/total/ {print $4}')

echo "Total Disk: $total MB"
echo "Free: $free MB" 
echo "Free(%):" $(echo "scale=2; $free / $total * 100" | bc -l)"%"
echo "Used: $used MB" 
echo "Used(%): " $(echo "scale=2; $used / $total * 100" | bc -l)"%"
echo ""


echo "Top 5 processes by CPU usage"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""


echo "Top 5 processes by Memory usage"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo ""


echo "OS Version:" $(cat /etc/os-release | grep 'PRETTY_NAME' | cut -f 2 -d '=' | tr -d '"')
echo "Kernel:" $(uname -r)
echo "Hostname:" $(hostname)
echo "Uptime:" $(uptime -p)
echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"
echo ""

echo "List of logged-in users:"
ps -eo user,uid | awk 'NR>1 && $2 >= 1000 {print $1}' | sort | uniq
echo ""

if command -v faillog &> /dev/null; then
    echo "Failed Login Attempts (last 10):"
    lastb -n 10 2>/dev/null || echo "  No failed login attempts found or restricted access."
    echo ""
else
    echo "Failed Login Attempts:"
    echo "  faillog command not available on this system."
    echo ""
fi

echo "End of Report"