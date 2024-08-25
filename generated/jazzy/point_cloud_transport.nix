{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message_filters,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rcpputils,
  rmw,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_transport = substituteSource {
      src = fetchgit {
        name = "point_cloud_transport-source";
        url = "https://github.com/ros2-gbp/point_cloud_transport-release.git";
        rev = "452aa97f48936798370822d1ac54ba8fd430050a";
        hash = "sha256-LXXo41jU5dP7mjE6H0OcgvjAAylkW4eC+cV9YE82TF0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_transport";
  version = "4.0.2-1";
  src = sources.point_cloud_transport;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters pluginlib rclcpp rclcpp_components rcpputils rmw sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Support for transporting PointCloud2 messages in compressed format and plugin interface for implementing additional PointCloud2 transports.";
  };
}
