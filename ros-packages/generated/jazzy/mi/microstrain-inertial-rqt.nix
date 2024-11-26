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
  version = "4.5.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_rqt";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ geometry-msgs microstrain-inertial-msgs nav-msgs rclpy rqt-gui rqt-gui-py std-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "microstrain_inertial_rqt" = substituteSource {
        src = fetchgit {
          name = "microstrain_inertial_rqt-source";
          url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
          rev = "c25780e62172aa94a2b2aef49f25b3ce33bd1cc2";
          hash = "sha256-rlZo2M8zgAec4dXU3PT5NM87THpdk3pAbPp0F5QLkRc=";
        };
      };
    });
  };
  meta = {
    description = "The microstrain_inertial_rqt package provides several RQT widgets to view the status of Microstrain devices";
  };
})
