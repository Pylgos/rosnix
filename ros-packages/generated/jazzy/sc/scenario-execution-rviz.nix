{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  py-trees-ros-interfaces,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  scenario-execution-interfaces,
  std-srvs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "scenario_execution_rviz";
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."scenario_execution_rviz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs py-trees-ros-interfaces rclcpp rviz-common scenario-execution-interfaces std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_rviz" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_rviz-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "5212d394d7948664fb5217cbb2e34c6a19e44d08";
        hash = "sha256-p27uZ5eR/tar0rcEeDdT7Pvfm3ELidJuZwuzWfXOQzQ=";
      };
    };
  });
  meta = {
    description = "The scenario_execution_rviz package";
  };
})
