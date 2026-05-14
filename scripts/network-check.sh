#!/bin/bash
# 网络连通性检查工具
# 用法: ./network-check.sh [host]

HOST=${1:-"github.com"}
echo "🔍 检查网络连通性..."
echo "目标: $HOST"
echo "---"

# Ping
ping -c 2 -W 2 $HOST 2>&1 | tail -1

# HTTP
curl -s -o /dev/null -w "HTTP状态: %{http_code} (%{time_total}s)\n" https://$HOST --max-time 5

echo "---"
echo "本机IP: $(curl -s --max-time 5 ifconfig.me 2>/dev/null || echo '无法获取')"
