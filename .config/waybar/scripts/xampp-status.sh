#!/bin/bash

if pgrep -f "httpd" >/dev/null; then
  echo "🟢 XAMPP"
else
  echo "🔴 XAMPP"
fi
