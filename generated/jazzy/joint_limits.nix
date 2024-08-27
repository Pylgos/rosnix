{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  ament_cmake_gtest,
  backward_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  launch_ros,
  launch_testing_ament_cmake,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  substituteSource,
  trajectory_msgs,
  urdf,
}:
let
  sources = rec {
    joint_limits = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "be6c80dfc8743b06305ed3536aa21d888c0edcc3";
        hash = "sha256-hFhuYB3MTCFuXkMnlH3h1AtMVtAfd1PolOqgW4yJY/0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_limits";
  version = "4.16.1-1";
  src = sources.joint_limits;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros pluginlib rclcpp rclcpp_lifecycle realtime_tools trajectory_msgs urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest generate_parameter_library launch_ros launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Package with interfaces for handling of joint limits in controllers or in hardware. The package also implements Saturation Joint Limiter for position-velocity-acceleration set and other individual interfaces.";
  };
}
