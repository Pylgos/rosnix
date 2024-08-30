{
  ament_cmake_auto,
  buildRosPackage,
  cv_bridge,
  depthai_ros_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  message_filters,
  opencv,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  substituteSource,
  vision_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    depthai_filters = substituteSource {
      src = fetchgit {
        name = "depthai_filters-source";
        url = "https://github.com/luxonis/depthai-ros-release.git";
        rev = "c6e177928d878eccc46f6821108ada320518d62e";
        hash = "sha256-V1Od5P8G5xuFU5r4KoAeYtsDMacFNqHTR9pEPiF8YRg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "depthai_filters";
  version = "2.10.0-1";
  src = sources.depthai_filters;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge depthai_ros_msgs image_transport message_filters opencv rclcpp rclcpp_components sensor_msgs vision_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Depthai filters package";
  };
}
