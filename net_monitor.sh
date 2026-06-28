#!/bin/bash
# net_monitor.sh - Network Port and Connection Monitor
# Author: [Your Name]
# Description: Displays listening ports, associated processes, and active connections.

clear

echo "=============================================="
echo "   🌐 NETWORK PORT & CONNECTION MONITOR 🌐"
echo "=============================================="
echo ""

# 1. Listening Ports (TCP & UDP) with Process Info
# -t: TCP, -u: UDP, -l: Listening, -p: Process, -n: Numeric
echo "🔌 LISTENING PORTS (TCP/UDP)"
echo "----------------------------------------------"
# Requires sudo to see process names for all users
if [ "$EUID" -ne 0 ]; then 
  echo "⚠️  Note: Run with 'sudo' to see all process names."
fi

ss -tulnp | grep LISTEN | head -n 10
# If ss fails or shows no info, try: netstat -tulnp | grep LISTEN

echo ""

# 2. Active Established Connections
# Shows who is connected to you (Remote IP)
echo "🔗 ACTIVE ESTABLISHED CONNECTIONS"
echo "----------------------------------------------"
ss -tnp state established | head -n 10

echo ""

# 3. Top 5 Processes with Most Connections
echo "📊 TOP 5 PROCESSES BY CONNECTION COUNT"
echo "----------------------------------------------"
ss -tnp | awk 'NR>1 {print $6}' | cut -d'"' -f2 | sort | uniq -c | sort -rn | head -n 5

echo ""
echo "=============================================="
echo "Scan completed at: $(date)"
echo "=============================================="   
