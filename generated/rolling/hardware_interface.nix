{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_limits,
  lifecycle_msgs,
  pluginlib,
  rclcpp_lifecycle,
  rcpputils,
  rcutils,
  ros2_control_test_assets,
  substituteSource,
  tinyxml2_vendor,
  urdf,
}:
let
  sources = rec {
    hardware_interface = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "759294460f73e8051e6dfbd15edec7bf2f5cb2bb";
        hash = "sha256-JoZmlkvoVIf9v7tYAS9WkFDM59/QWkFTaQ3ZxY/rJtQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface";
  version = "4.16.1-1";
  src = sources.hardware_interface;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs joint_limits lifecycle_msgs pluginlib rclcpp_lifecycle rcpputils rcutils tinyxml2_vendor urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "ros2_control hardware interface";
  };
}
