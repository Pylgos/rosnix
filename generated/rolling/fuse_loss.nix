{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  libsForQt5,
  pluginlib,
  qt5,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_loss = substituteSource {
      src = fetchgit {
        name = "fuse_loss-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "370a1067045c01ebb2b3bc7c6c4cde3d05583b3d";
        hash = "sha256-HTtg7uE0fuI/bzd2g3aY5o2GTttu/qH6Tv8Hc+eFgaA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_loss";
  version = "1.2.0-1";
  src = sources.fuse_loss;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver fuse_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common libsForQt5.qwt qt5.qtbase ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_loss package provides a set of commonly used loss functions, such as the basic ones provided by Ceres.";
  };
}
