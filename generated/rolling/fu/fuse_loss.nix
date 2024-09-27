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
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_loss-7b05d6a1ccd5499886f3496e98369afc3681b637 = substituteSource {
      src = fetchgit {
        name = "fuse_loss-7b05d6a1ccd5499886f3496e98369afc3681b637-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "7b05d6a1ccd5499886f3496e98369afc3681b637";
        hash = "sha256-06MhRmCfOfKljgI2ebmY/Rm9fh0ROvWMgpyPxJD/aKs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_loss";
  version = "1.2.1-1";
  src = sources.fuse_loss-7b05d6a1ccd5499886f3496e98369afc3681b637;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqwt-qt5-dev" "qtbase5-dev" ]; };
  meta = {
    description = "The fuse_loss package provides a set of commonly used loss functions, such as the basic ones provided by Ceres.";
  };
}
