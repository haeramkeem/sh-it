# Register a custom systemd service

## About

A simple guide to register an user-custom systemd service

The testing daemon `timerd` prints `Current time: ...` every 1 sec

## How to

1. Move binary or script to the /usr/local/bin

```bash
sudo mv timerd /usr/local/bin/
```

2. Register service

```bash
sudo mv timerd.service /etc/systemd/system/
```

3. Start service permanently

```bash
sudo systemctl enable --now timerd.service
```

4. Show systemd service status

```bash
sudo systemctl status timerd.service
```

5. Show logs

```bash
sudo journalctl -xeu timerd
```
