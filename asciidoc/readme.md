# LeoCloud Online Documentation

Asciidoc ist used as a documentation tool. We want it without
a lot of installation so we use the docker image.

This gives a problem: asciidoctor runs as root in its docker container and if we use host mounted volumes the output can only be deleted by the super user.

So we use a host mounted volume as the output folder.
Later we mount this folder in busybox and copy it from there
to our local machine