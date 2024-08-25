{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  message_filters,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
}:
let
  sources = rec {
    imu_transformer = substituteSource {
      src = fetchgit {
        name = "imu_transformer-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "fa9d7c47c35a05548c3db37bfa58ba7d99d7ff61";
        hash = "sha256-lcQiOtqXK/0Dj9s+hSjZPSC6ypDEmOUVpRrIqNzO+Qw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_transformer";
  version = "0.5.0-3";
  src = sources.imu_transformer;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ message_filters rclcpp rclcpp_components sensor_msgs tf2_ros tf2_sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ geometry_msgs tf2_geometry_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Node/components to transform sensor_msgs::Imu data from one frame into another.";
  };
}
