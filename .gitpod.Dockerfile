FROM osrf/ros:foxy-desktop

# USER gitpod
# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN apt update && export DEBIAN_FRONTEND=noninteractive && apt install -y curl gnupg lsb-release && \
#     curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
#     echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null    apt update && \
#     apt upgrade -y && \
#     apt install -y ros-foxy-desktop python3-colcon-common-extensions python3-rosdep iputils-ping flake8 && \
#     rm -rf /var/lib/apt/lists/*

# RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
# RUN source /opt/ros/foxy/setup.bash
# More information: https://www.gitpod.io/docs/config-docker/
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod
USER gitpod
RUN sed -i '$isource "/opt/ros/foxy/setup.bash"' /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

