{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  microstrain-inertial-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  rqt-gui-py,
  std-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "microstrain_inertial_rqt";
  version = "4.6.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_rqt";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs microstrain-inertial-msgs nav-msgs rclpy rqt-gui rqt-gui-py std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_rqt" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_rqt-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "3dd0ff3a2da1561d4b659164f547f7ca8d37c721";
        hash = "sha256-UaDtThUUzF5UfdwPBD+6zCexp/yceRQ3KsujubrLEJI=";
      };
    };
  });
  meta = {
    description = "The microstrain_inertial_rqt package provides several RQT widgets to view the status of Microstrain devices";
  };
})
