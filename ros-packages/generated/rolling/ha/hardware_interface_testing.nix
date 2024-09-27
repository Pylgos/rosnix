{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  lifecycle_msgs,
  mkSourceSet,
  pluginlib,
  rclcpp_lifecycle,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "hardware_interface_testing" = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "3768454cfed8eae20928ed6590e61f66dc2adaf5";
        hash = "sha256-jz31QvdkDdmDNE9acMVgclymnN9SpQmny9VBAFl+Ll8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "hardware_interface_testing";
  version = "4.17.0-1";
  src = sources."hardware_interface_testing";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control_msgs hardware_interface lifecycle_msgs pluginlib rclcpp_lifecycle ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control hardware interface testing";
  };
}
