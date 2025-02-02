#include "pluginlib/class_list_macros.hpp"
#include "nav2_costmap_2d/costmap_filters/binary_filter.hpp"
#include "nav2_costmap_2d/costmap_filters/keepout_filter.hpp"
#include "nav2_costmap_2d/costmap_filters/speed_filter.hpp"

PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::BinaryFilter, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::KeepoutFilter, nav2_costmap_2d::Layer)
PLUGINLIB_EXPORT_CLASS(nav2_costmap_2d::SpeedFilter, nav2_costmap_2d::Layer)
