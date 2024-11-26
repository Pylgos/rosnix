{
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  rclpy,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_gui";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."rqt_gui";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-catkin-pkg-modules" ]; };
  propagatedBuildInputs = [ ament-index-python python-qt-binding qt-gui rclpy ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui" = substituteSource {
      src = fetchgit {
        name = "rqt_gui-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "1de48c2c3878bf790611897afb321c5a0d1f9051";
        hash = "sha256-TSRsxfzC3BWWU1G9d/76GSxgcxrWOYbSHLnq0C2qNfA=";
      };
    };
  });
  meta = {
    description = "rqt_gui provides the main to start an instance of the ROS integrated graphical user interface provided by qt_gui.";
  };
})
