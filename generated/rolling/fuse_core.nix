{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_msgs,
  geometry_msgs,
  glog,
  launch,
  launch_pytest,
  pluginlib,
  python3Packages,
  rcl_interfaces,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    fuse_core = substituteSource {
      src = fetchgit {
        name = "fuse_core-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "0f67cd8e47c66382aca8e9217b558f2815f43186";
        hash = "sha256-Z0QhzLJ70YQiE/7gYIKD1NRrSy7HGc/Fp15k/LEyo50=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_core";
  version = "1.2.0-1";
  src = sources.fuse_core;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen fuse_msgs glog pluginlib python3Packages.boost rcl_interfaces rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common geometry_msgs launch launch_pytest rclcpp ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_core package provides the base class interfaces for the various fuse components. Concrete implementations of these interfaces are provided in other packages.";
  };
}
