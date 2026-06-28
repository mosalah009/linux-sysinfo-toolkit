#!/bin/bash
# sysinfo.sh - A mini toolkit to display essential system information
# Author: [Your Name]
# Description: Displays username, hostname, IP address, and OS details.

# Clear the screen for a clean look
clear

echo "=========================================="
echo "       🛡️  SYSTEM INFORMATION TOOLKIT  🛡️"
echo "=========================================="
echo ""

# 1. Username & User ID
# whoami: prints effective user name
# id: prints user and group info
echo "👤 USER INFORMATION"
echo "   Username : $(whoami)"
echo "   User ID  : $(id -u)"
echo ""

# 2. Hostname & Domain
# hostname: prints the system's network name
echo "🖥️  HOST INFORMATION"
echo "   Hostname : $(hostname)"
echo "   FQDN     : $(hostname -f)"  # Fully Qualified Domain Name
echo ""

# 3. IP Address
# hostname -I: prints all network IP addresses (cleaner than ifconfig)
# awk '{print $1}': grabs only the first IP to keep it tidy
echo "🌐 NETWORK INFORMATION"
echo "   IP Address : $(hostname -I | awk '{print $1}')"
echo ""

# 4. Operating System Details
# uname -r: kernel version
# uptime: how long system has been running
echo "⚙️  SYSTEM DETAILS"
echo "   Kernel     : $(uname -r)"
echo "   Architecture: $(uname -m)"
echo "   Uptime     : $(uptime -p)"
echo ""
echo "=========================================="
echo "Report generated on: $(date)"
echo "=========================================="   
