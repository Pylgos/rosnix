{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_graphs,
  fuse_msgs,
  fuse_variables,
  geometry_msgs,
  nav_msgs,
  pluginlib,
  rclcpp,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    fuse_publishers = substituteSource {
      src = fetchgit {
        name = "fuse_publishers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "e42da48d8d0c58cb5bff839478ed8e423e959f74";
        hash = "sha256-tI9Xxj7PiAdTcEHsNLiz1j74FStbd7vEnIFopSJRkPU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_publishers";
  version = "1.1.1-1";
  src = sources.fuse_publishers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fuse_core fuse_msgs fuse_variables geometry_msgs nav_msgs pluginlib rclcpp tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common fuse_constraints fuse_graphs rclcpp ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_publishers package provides a set of common publisher plugins.";
  };
}
