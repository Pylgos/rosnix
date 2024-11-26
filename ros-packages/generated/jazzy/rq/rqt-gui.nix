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
  version = "1.6.0-2";
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
        rev = "8eec9c6a8d6951524a0d1fe98f9640ef8ef40267";
        hash = "sha256-nY0zbmJ/xPK7ZekKh0ONOV+us66g03mWsFQeC42Wx7Y=";
      };
    };
  });
  meta = {
    description = "rqt_gui provides the main to start an instance of the ROS integrated graphical user interface provided by qt_gui.";
  };
})
