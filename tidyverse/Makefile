latest:
	docker build -t rocker/tidyverse .

latest-rhel7:
	sudo podman build -t quay.io/rocker/tidyverse:rhel7-3.6.0 -f ./Dockerfile.rhel .
	sudo podman tag quay.io/rocker/tidyverse:rhel7-3.6.0 quay.io/rocker/tidyverse:rhel7-latest

