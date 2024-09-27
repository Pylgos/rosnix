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
    fuse_constraints-29aa0e5c4fe2bd6fe6a62821bba6bb542295df92 = substituteSource {
      src = fetchgit {
        name = "fuse_constraints-29aa0e5c4fe2bd6fe6a62821bba6bb542295df92-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "29aa0e5c4fe2bd6fe6a62821bba6bb542295df92";
        hash = "sha256-tmhdgTp2sntBuFANPXC7zCPENIzjlk57HXZ8WscmnGU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_constraints";
  version = "1.2.1-1";
  src = sources.fuse_constraints-29aa0e5c4fe2bd6fe6a62821bba6bb542295df92;
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
