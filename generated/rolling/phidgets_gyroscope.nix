{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_gyroscope = substituteSource {
      src = fetchgit {
        name = "phidgets_gyroscope-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "9a124bf6171fd1ac6d42166fad230f4d9b88c0d0";
        hash = "sha256-umLPYnGNeRNHzYU1z5tXxDJe/QFYAnmXCCPxLFH4E5U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_gyroscope";
  version = "2.3.3-1";
  src = sources.phidgets_gyroscope;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch phidgets_api rclcpp rclcpp_components sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Driver for the Phidgets Gyroscope devices";
  };
}
