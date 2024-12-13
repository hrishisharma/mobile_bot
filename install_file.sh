#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

# Install ROS2 slam_toolbox
sudo apt install -y ros-humble-slam-toolbox

# Install ROS2 Navigation2 (Nav2)
sudo apt install -y ros-humble-nav2-bringup

# Install ROS2 Twist Mux
sudo apt install -y ros-humble-twist-mux

# Install Gazebo
sudo apt install -y gazebo11 ros-humble-gazebo-ros-pkgs

# Install ROS2 Controller Manager and Controllers
sudo apt install -y ros-humble-ros2-control ros-humble-ros2-controllers

# Install Xacro
sudo apt install -y ros-humble-xacro

# Notify completion
echo "All required libraries have been installed successfully."

