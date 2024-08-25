{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    fuse_variables = substituteSource {
      src = fetchgit {
        name = "fuse_variables-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "145adf8242958fb6fcd560f0dd2290831f56b5c3";
        hash = "sha256-AMhieBzcBZ3yM1FzMq5T4FSo0yIRC4CmcOU3jOloF0Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_variables";
  version = "1.1.1-1";
  src = sources.fuse_variables;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver fuse_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rclcpp ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_variables package provides a set of commonly used variable types, such as 2D and 3D positions, \\ orientations, velocities, and accelerations.";
  };
}
