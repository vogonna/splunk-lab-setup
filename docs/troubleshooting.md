# Splunk Lab Troubleshooting Guide

## Common Installation Issues

### Disk Space Problems
```bash
# Check disk space
df -h

# Clean up space
sudo apt clean
sudo apt autoremove --purge
sudo journalctl --vacuum-size=100M

# Check if Splunk is running
sudo /opt/splunk/bin/splunk status

# Check if ports are open
ss -tlnp | grep -E '8000|8089'

# Test web interface
curl -I http://localhost:8000

ar x splunk-9.3.0.deb
tar -xJf data.tar.xz -C ~/
sudo mv ~/opt/splunk /opt/

# Start Splunk
sudo /opt/splunk/bin/splunk start

# Stop Splunk
sudo /opt/splunk/bin/splunk stop

# Restart Splunk
sudo /opt/splunk/bin/splunk restart

# Check status
sudo /opt/splunk/bin/splunk status
