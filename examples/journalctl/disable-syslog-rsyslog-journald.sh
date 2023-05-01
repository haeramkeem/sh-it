#!/bin/bash

# Disable rsyslog daemon and syslog socket
sudo systemctl disable --now syslog.socket rsyslog.service

# Disable journald daemon
sudo systemctl disable --now systemd-journald.socket systemd-journald-dev-log.socket systemd-journald.service
