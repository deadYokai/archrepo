
# My personal repo for ArchLinux

Import key
```bash
pacman-key --recv-keys 11AB43077E240E19EA773113128753272FB3D91D
pacman-key --lsign-key 11AB43077E240E19EA773113128753272FB3D91D
```

Add to `/etc/pacman.conf`
```

[deadyokai]
Server = https://repo.vilafox.xyz/x86_64

```

