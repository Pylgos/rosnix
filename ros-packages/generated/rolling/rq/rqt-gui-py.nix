{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  qt-gui,
  rclpy,
  rosSystemPackages,
  rqt-gui,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_gui_py";
  version = "1.10.4-1";
  src = finalAttrs.passthru.sources."rqt_gui_py";
  propagatedNativeBuildInputs = [ python-qt-binding qt-gui rclpy rqt-gui ];
  propagatedBuildInputs = [ python-qt-binding qt-gui rclpy rqt-gui ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_py" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_py-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "a6c1bc9c8347f0ce61844e22baf2511aaea3347e";
        hash = "sha256-HpvfS/jdACMsmfpwcsENyxPuWcEE9uiRoRZK+HZzHI8=";
      };
    };
  });
  meta = {
    description = "rqt_gui_py enables GUI plugins to use the Python client library for ROS.";
  };
})
