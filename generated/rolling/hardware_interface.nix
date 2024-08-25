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
        rev = "dff55affa76d0423d728d4577fe9988f7fc25b8b";
        hash = "sha256-KPZVmSSPZRi4zkEDL1vmrrBB3dXMYfj/txayMrQ0Olg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface";
  version = "4.16.0-1";
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
