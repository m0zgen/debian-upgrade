# Upgrade Debian to latest release and installed packages

## Default

Run `apt-get` commands:
```
apt-get update; apt-get -y upgrade; apt-get -y dist-upgrade; apt-get -y --purge autoremove
```

## Apt

Run `apt` commands:
```
apt update; apt -y upgrade; apt -y full-upgrade; apt -y --purge autoremove
```

With `start.sh` argument:
```
./start.sh -a
```