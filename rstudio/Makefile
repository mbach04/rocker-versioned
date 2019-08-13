latest:
	docker build -t rocker/rstudio .

latest-rhel7:
	sudo podman build -t quay.io/rocker/rstudio:rhel7-latest -f ./Dockerfile.rhel .

sync:
	echo 3.* devel | xargs -n 1 cp userconf.sh
	echo 3.* devel | xargs -n 1 cp disable_auth_rserver.conf


