{
  ament_cmake,
  ament_cmake_cpplint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  tf2_ros,
}:
let
  sources = rec {
    imu_processors = substituteSource {
      src = fetchgit {
        name = "imu_processors-source";
        url = "https://github.com/ros2-gbp/imu_pipeline-release.git";
        rev = "438faa657139abc7315d8d38d35b125c385e812c";
        hash = "sha256-ShCwGu82++kzA8jDNQZHJIG8R7Av04iVDxp8sMYze2g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_processors";
  version = "0.5.0-3";
  src = sources.imu_processors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nav_msgs rclcpp rclcpp_components sensor_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_cpplint ];
  missingDependencies = [  ];
  meta = {
    description = "Processors for sensor_msgs::Imu data";
  };
}
