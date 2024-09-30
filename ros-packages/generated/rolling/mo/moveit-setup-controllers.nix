{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-configs-utils,
  moveit-resources-fanuc-moveit-config,
  moveit-resources-panda-moveit-config,
  moveit-setup-framework,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_setup_controllers" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_controllers-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b6d0b618518458a6d711112f6ec01bd0c9e640c8";
        hash = "sha256-xHSHodH3QAwtg8BfJ6wvnqQhgk+uN3U3AIGN76yE85k=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_setup_controllers";
  version = "2.11.0-1";
  src = sources."moveit_setup_controllers";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-cpp moveit-setup-framework pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest moveit-configs-utils moveit-resources-fanuc-moveit-config moveit-resources-panda-moveit-config ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "MoveIt Setup Steps for ROS 2 Control";
  };
}
