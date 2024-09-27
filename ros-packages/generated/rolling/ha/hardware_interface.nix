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
  mkSourceSet,
  pluginlib,
  rclcpp_lifecycle,
  rcpputils,
  rcutils,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
  tinyxml2_vendor,
  urdf,
}:
let
  sources = mkSourceSet (sources: {
    "hardware_interface" = substituteSource {
      src = fetchgit {
        name = "hardware_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "e88207217dc4f61ce26fd21ef65627889138e09f";
        hash = "sha256-JHXgQo0Gg7eFU5T+H1StU9iMrlbiVQlu9M5Mx0E9JCY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "hardware_interface";
  version = "4.17.0-1";
  src = sources."hardware_interface";
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control_msgs joint_limits lifecycle_msgs pluginlib rclcpp_lifecycle rcpputils rcutils tinyxml2_vendor urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control hardware interface";
  };
}
