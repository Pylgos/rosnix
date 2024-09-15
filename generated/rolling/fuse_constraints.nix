{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  fuse_graphs,
  fuse_variables,
  geometry_msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fuse_constraints = substituteSource {
      src = fetchgit {
        name = "fuse_constraints-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d8f46ad8c87f7a535538f49a50b3c409e7c60ef8";
        hash = "sha256-lJ5LV3USpNdPXZkkiq9w0tDV9iGXEc6XDxbIrEbuPlw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_constraints";
  version = "1.2.0-1";
  src = sources.fuse_constraints;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_core fuse_graphs fuse_variables geometry_msgs pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libceres-dev" "suitesparse" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  meta = {
    description = "The fuse_constraints package provides a set of commonly used constraint types, such as direct measurements on \\ state variables (absolute constraints) or measurements of the state changes (relative constraints).";
  };
}
