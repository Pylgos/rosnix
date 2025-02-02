#include "pluginlib/class_list_macros.hpp"
#include "nav2_costmap_2d/denoise_layer.hpp"
#include "nav2_costmap_2d/inflation_layer.hpp"
#include "nav2_costmap_2d/obstacle_layer.hpp"
#include "nav2_costmap_2d/plugin_container_layer.hpp"
#include "nav2_costmap_2d/range_sensor_layer.hpp"
#include "nav2_costmap_2d/static_layer.hpp"
#include "nav2_costmap_2d/voxel_layer.hpp"

PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::DenoiseLayer, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::InflationLayer, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::ObstacleLayer, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::PluginContainerLayer, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::RangeSensorLayer, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::StaticLayer, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::VoxelLayer, nav2_costmap_2d::Layer)
