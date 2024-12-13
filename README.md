# **Mobile_bot**

## **Idea**
A rover capable of performing **mapping, localizing, and navigating** itself through the map!

*This package has been created and tested on Ubuntu 22.04 with ROS2 Humble, Gazebo 11.10.2, Rviz2, and Nav2 stack.*
## **Install**
*run install_file.sh*
```
./install_file.sh
```

## **How to build**
*Creating a workspace to build the package*
```
mkdir -p ~/mobile_bot_ws/src && cd ~/mobile_bot_ws/src
```

*Cloning the package*
```
git clone https://github.com/hrishisharma/mobile_bot.git
cd ~/mobile_bot_ws
```
*Installing the dependencies and building the workspace*
```
colcon build --symlink-install
```

## **Mapping**
First, edit the [mapper_params_online_async.yaml]
file to set the mode to mapping.
```
    mode: mapping   # Changed from visualization

    map_file_name: test_name    # comment this

    map_start_at_dock: true     # comment this
```
Now you can start mapping by following these commands
```
# source the workspace
source ~/mobile_bot_ws/install/setup.bash

# Launching Gazebo and controllers
ros2 launch mobile_bot launch_sim.launch.py world:=./src/mobile_bot/worlds/obstacles.world

# Launch the slam_toolbox
ros2 launch slam_toolbox online_async_launch.py slam_params_file:=./src/mobile_bot/config/mapper_params_online_async.yaml use_sim_time:=true

# Run rviz with the saved configuration
rviz2 -d src/mobile_bot/config/mapping.rviz

# Run teleop_twist_keyboard to control the rover
ros2 run teleop_twist_keyboard teleop_twist_keyboard -r /cmd_vel:=/diff_cont/cmd_vel_unstamped
```

## **Localization**

First, edit the [mapper_params_online_async.yaml]
file to set the mode to localization and add the saved map.
```
    mode: localization  # Changed from mapping

    map_file_name: # path to your saved map

    map_start_at_dock: true
```
Now you can run the following commands to visualize.
```
# source the workspace
source ~/mobile_bot_ws/install/setup.bash

# Launching Gazebo and controllers
ros2 launch mobile_bot launch_sim.launch.py world:=./src/mobile_bot/worlds/obstacles.world

# Launch the slam_toolbox
ros2 launch slam_toolbox online_async_launch.py slam_params_file:=./src/mobile_bot/config/mapper_params_online_async.yaml use_sim_time:=true

# Run rviz with the saved configuration
rviz2 -d src/mobile_bot/config/slamming.rviz

# Run teleop_twist_keyboard to control the rover
ros2 run teleop_twist_keyboard teleop_twist_keyboard -r /cmd_vel:=/diff_cont/cmd_vel_unstamped
```  

