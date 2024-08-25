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
        rev = "fdcbf8fbc5299d008c477f6209dba3327209a348";
        hash = "sha256-UI97al3MJICK6Np2KR7c9WyJXc15H6WwZtsidJTl48Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_variables";
  version = "1.2.0-1";
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
