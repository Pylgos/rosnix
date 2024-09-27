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
  rosSystemPackages,
  substituteSource,
  trajectory_msgs,
  urdf,
}:
let
  sources = rec {
    joint_limits-9f7d0e5b4c66088d06a044d1577946760e2818e6 = substituteSource {
      src = fetchgit {
        name = "joint_limits-9f7d0e5b4c66088d06a044d1577946760e2818e6-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "9f7d0e5b4c66088d06a044d1577946760e2818e6";
        hash = "sha256-yPl+M40WqE2EVSG+Zrlc4fJeNcxEhuQruYlm9CtmCxg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_limits";
  version = "4.17.0-1";
  src = sources.joint_limits-9f7d0e5b4c66088d06a044d1577946760e2818e6;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros pluginlib rclcpp rclcpp_lifecycle realtime_tools trajectory_msgs urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest generate_parameter_library launch_ros launch_testing_ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package with interfaces for handling of joint limits in controllers or in hardware. The package also implements Saturation Joint Limiter for position-velocity-acceleration set and other individual interfaces.";
  };
}
