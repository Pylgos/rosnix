{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
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
      src = fetchFromGitHub {
        name = "fuse_core-source";
        owner = "ros2-gbp";
        repo = "fuse-release";
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
