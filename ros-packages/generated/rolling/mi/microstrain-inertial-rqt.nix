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
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ geometry-msgs microstrain-inertial-msgs nav-msgs rqt-gui rqt-gui-py std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_rqt" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_rqt-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "bb0bea59a329365dcc59a39367fa27e3d482da1d";
        hash = "sha256-NSwL/WZORnveEvtymPAVy84PneCG6oV/iyJUiWuznUM=";
      };
    };
  });
  meta = {
    description = "The microstrain_inertial_rqt package provides several RQT widgets to view the status of Microstrain devices";
  };
})
