# Dockerfile to run Logitech Media Server (LMS) on Raspberry Pi

## How-To Build

```
docker build -t lms .
```

## How-To Run

```
docker run -d \
	--restart=unless-stopped \
	-p 3483:3483 \
	-p 3483:3483/udp \
	-p 9000:9000 \
	-p 9090:9090 \
	--hostname="$HOSTNAME-docker-lms" \
	-v "/etc/localtime":"/etc/localtime":ro \
	-v lms-data:/var/lib/squeezeboxserver \
	-v lms-log:/var/log/squeezeboxserver \
	-v /mnt/hd1/music:/media/music:ro \
	--name="lms" \
	lms:latest
```

## References

- [Logitech Squeezebox][MySB]
- [Logitech Squeezebox Wiki][SB-Wiki]
- [Logitech Squeezebox Forums][SB-Forums]
- [Logitech Media Server Nightly Builds][LMS-Nightly]
- [Logitech Media Server Source Code][LMS-Git]

[MySB]: http://www.mysqueezebox.com/
[SB-Wiki]: http://wiki.slimdevices.com/
[SB-Forums]: http://forums.slimdevices.com/
[LMS-Nightly]: http://wiki.slimdevices.com/index.php/Nightly_Builds
[LMS-Git]: https://github.com/Logitech/slimserver
