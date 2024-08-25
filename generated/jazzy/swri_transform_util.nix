{
  ament_cmake,
  ament_cmake_python,
  buildPackages,
  buildRosPackage,
  cv_bridge,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  geos,
  gps_msgs,
  libyamlcpp,
  marti_nav_msgs,
  pkg-config,
  proj,
  python3Packages,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rclpy,
  sensor_msgs,
  substituteSource,
  swri_math_util,
  swri_roscpp,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    swri_transform_util = substituteSource {
      src = fetchgit {
        name = "swri_transform_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "0f1230b1c13063e9390695025cb4840edb4c719e";
        hash = "sha256-bC4r0nZwj85Y2JxDOl/WzHymbONWD96uLlidPbnTW1c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_transform_util";
  version = "3.6.1-3";
  src = sources.swri_transform_util;
  nativeBuildInputs = [ ament_cmake ament_cmake_python pkg-config ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge diagnostic_msgs diagnostic_updater geographic_msgs geometry_msgs geos gps_msgs libyamlcpp marti_nav_msgs proj python3Packages.boost rcl_interfaces rclcpp rclcpp_components rclpy sensor_msgs swri_math_util swri_roscpp tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The swri_transform_util package contains utility functions and classes for transforming between coordinate frames.";
  };
}
