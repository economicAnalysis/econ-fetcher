#
# Python Dockerfile
#
# https://github.com/dockerfile/python
#

# Pull base image.
FROM    ubuntu:14.04

# Install Python.
RUN     sudo apt-get update && apt-get install -y python python-dev python-pip python-virtualenv && rm -rf /var/lib/apt/lists/*

# Install SSH daemon and set up supervisor
RUN     apt-get install -y openssh-server supervisor
RUN     mkdir -p /var/run/sshd
RUN     mkdir -p /var/log/supervisor
RUN     mkdir /root/.ssh/


# ADD <src> <dest>. <src> must be the path to a file or directory relative to the source directory being built
# These are the keys that allow us to ssh into the container.
ADD     fetcher_docker_rsa.pub /tmp/fetcher_docker_rsa.pub
RUN     cat /tmp/fetcher_docker_rsa.pub >> /root/.ssh/authorized_keys && rm -f /tmp/fetcher_docker_rsa.pub

ADD     ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Load and install the app
ADD     . /src

EXPOSE 22

# Set the default command to run when starting the container
CMD ["/usr/bin/supervisord"]