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
  version = "4.6.1-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_rqt";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs microstrain-inertial-msgs nav-msgs rclpy rqt-gui rqt-gui-py std-msgs ];
  propagatedBuildInputs = [ geometry-msgs microstrain-inertial-msgs nav-msgs rclpy rqt-gui rqt-gui-py std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_rqt" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_rqt-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "fd79201e4bb7f993525959aa344f6d3d153c6c47";
        hash = "sha256-NSwL/WZORnveEvtymPAVy84PneCG6oV/iyJUiWuznUM=";
      };
    };
  });
  meta = {
    description = "The microstrain_inertial_rqt package provides several RQT widgets to view the status of Microstrain devices";
  };
})
