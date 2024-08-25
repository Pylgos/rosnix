{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_models,
  fuse_optimizers,
  fuse_publishers,
  fuse_variables,
  nav_msgs,
  rclcpp,
  rviz2,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_tutorials = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "b798d1797331227af144494496db6d2e4f9ae77e";
        hash = "sha256-MJ/6/ZGhZWoeSnnvobJccE9mDCVu/H56MJ5HFqB+lk0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_tutorials";
  version = "1.2.0-1";
  src = sources.fuse_tutorials;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_models fuse_optimizers fuse_publishers fuse_variables nav_msgs rclcpp rviz2 sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing source code for the fuse tutorials.";
  };
}
