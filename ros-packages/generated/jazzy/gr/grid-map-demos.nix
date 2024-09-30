{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-cv,
  grid-map-filters,
  grid-map-loader,
  grid-map-msgs,
  grid-map-octomap,
  grid-map-ros,
  grid-map-rviz-plugin,
  grid-map-visualization,
  mkSourceSet,
  octomap-msgs,
  octomap-rviz-plugins,
  octomap-server,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz2,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "grid_map_demos" = substituteSource {
      src = fetchgit {
        name = "grid_map_demos-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "f8ef8b26e250de7ad625a5cfbde7d95e4ee82690";
        hash = "sha256-1hNk5OqnoIp2LALotd5QPxfUP/Mc9QZMQeMYJNi6f1I=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "grid-map-demos";
  version = "2.2.0-1";
  src = sources."grid_map_demos";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv-bridge geometry-msgs grid-map-cmake-helpers grid-map-core grid-map-cv grid-map-filters grid-map-loader grid-map-msgs grid-map-octomap grid-map-ros grid-map-rviz-plugin grid-map-visualization octomap-msgs octomap-rviz-plugins octomap-server rclcpp rclpy rviz2 sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Demo nodes to demonstrate the usage of the grid map library.";
  };
}