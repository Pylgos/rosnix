{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse-constraints,
  fuse-core,
  fuse-models,
  fuse-optimizers,
  fuse-publishers,
  fuse-variables,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "fuse_tutorials" = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "c842277611c37e6233a2bd06da8f8660677f0bb6";
        hash = "sha256-0CIZCtVEMZceXY2Tq30oo/NCnqmcXavrMoG+GaGwFGE=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "fuse_tutorials";
  version = "1.2.1-1";
  src = sources."fuse_tutorials";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse-constraints fuse-core fuse-models fuse-optimizers fuse-publishers fuse-variables nav-msgs rclcpp rviz2 sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing source code for the fuse tutorials.";
  };
}
