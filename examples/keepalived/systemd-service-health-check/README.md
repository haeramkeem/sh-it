# Keepalived system service health check examples

## Ways of checking system service health

1. Using `killall` command
    - Using `killall` command with `-0` option is one of the common ways to check if the process is running or not.
    - It prints nothing when the process is running, and prints `~: no process found` error to the STDERR when it's not.
    - And it exits with status `0` when the process is running, and with status `1` when it's not.

```bash
# killall -0 ${PROCESS_NAME}
killall -0 nginx
```

2. Using `pgrep` command
    - Another option for checking process status is using `pgrep` command.
    - It prints pid only when the process is running.
    - And it exits with status `0` when the process is running, and with status `1` when it's not.

```bash
# pgrep ${PROCESS_NAME}
pgrep nginx
```

3. Using `systemctl`'s subcommand
    - The `systemctl` provides subcommand `is-active` that prints system service status to the STDOUT.
    - It prints `active` for active services and prints `inactive` for inactive services.
    - And it exits with status `0` when the service is active, and with status `3` when it's not.

```bash
# systemctl is-active ${SERVICE_NAME}
systemctl is-active nginx
```

## Using in keepalived config file

- To use health checking script in the keepalived config file, u have to specify it to the `vrrp_script` section.

```
vrrp_script master_health_check {
    script "checking command or script file path"
    interval 3
}
```

- The full example of `keepalived.conf` file is available [here](./keepalived.conf)
