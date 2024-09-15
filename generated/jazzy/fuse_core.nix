{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_msgs,
  geometry_msgs,
  launch,
  launch_pytest,
  pluginlib,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fuse_core = substituteSource {
      src = fetchgit {
        name = "fuse_core-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "b3b1cb3f75ff1d3fa4e45646dbdbf24f5497857b";
        hash = "sha256-Ge1xbnN6OG5f2HhwAR/cxfzZv6PBB4W7N18Zhhi0RL0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_core";
  version = "1.1.1-1";
  src = sources.fuse_core;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_msgs pluginlib rcl_interfaces rclcpp rclcpp_components ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" "libgoogle-glog-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common geometry_msgs launch launch_pytest rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The fuse_core package provides the base class interfaces for the various fuse components. Concrete implementations of these interfaces are provided in other packages.";
  };
}
