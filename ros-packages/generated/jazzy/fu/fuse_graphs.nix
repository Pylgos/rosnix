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
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fuse_graphs-d0b61c3be9af005a8bc82a956e46093c53dab16d = substituteSource {
      src = fetchgit {
        name = "fuse_graphs-d0b61c3be9af005a8bc82a956e46093c53dab16d-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d0b61c3be9af005a8bc82a956e46093c53dab16d";
        hash = "sha256-AusfOIWBhrljSrjmV1TdhWQl0a1eq5cjsk1nCwPdOe0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_graphs";
  version = "1.1.1-1";
  src = sources.fuse_graphs-d0b61c3be9af005a8bc82a956e46093c53dab16d;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "benchmark" ]; };
  meta = {
    description = "The fuse_graphs package provides some concrete implementations of the fuse_core::Graph interface.";
  };
}
