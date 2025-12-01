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
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."scenario_execution_rviz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs py-trees-ros-interfaces rclcpp rviz-common scenario-execution-interfaces std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs py-trees-ros-interfaces rclcpp rviz-common scenario-execution-interfaces std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "scenario_execution_rviz" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_rviz-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "1ac607726f6387a3496cdf5b6a8dc5543853bd07";
        hash = "sha256-w8dnKba7iAzXvyNblb1ghiCgttKRGoLgu5VgdALJD3g=";
      };
    };
  });
  meta = {
    description = "The scenario_execution_rviz package";
  };
})
