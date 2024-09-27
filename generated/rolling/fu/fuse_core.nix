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
    fuse_core-d3181024c8be26a36664947dcc39d99b5af61a6e = substituteSource {
      src = fetchgit {
        name = "fuse_core-d3181024c8be26a36664947dcc39d99b5af61a6e-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d3181024c8be26a36664947dcc39d99b5af61a6e";
        hash = "sha256-dm3DZhI8qWZUlH7XQKoCAmrPaZOKrmx8+lf6vaUpzzs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_core";
  version = "1.2.1-1";
  src = sources.fuse_core-d3181024c8be26a36664947dcc39d99b5af61a6e;
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
