{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-core,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "fuse_loss" = substituteSource {
      src = fetchgit {
        name = "fuse_loss-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "0f73e371eac052747faaa867ca413ef08c36d9a4";
        hash = "sha256-euEBZo32VlyBPb2xMuQ1jUISg2Z8v9ftPmATkr1iHOY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "fuse_loss";
  version = "1.1.1-1";
  src = sources."fuse_loss";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse-core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqwt-qt5-dev" "qtbase5-dev" ]; };
  meta = {
    description = "The fuse_loss package provides a set of commonly used loss functions, such as the basic ones provided by Ceres.";
  };
}
