FROM ros:humble-ros-core

# install ros package
RUN apt-get update && apt-get install -y \
        ros-${ROS_DISTRO}-demo-nodes-cpp && \
    rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc