{
  ament-flake8,
  ament-index-python,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-qt-binding,
  rclpy,
  rosSystemPackages,
  rosidl-runtime-py,
  rqt-console,
  rqt-gui,
  rqt-gui-py,
  rqt-py-common,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_msg";
  version = "1.5.1-3";
  src = finalAttrs.passthru.sources."rqt_msg";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding rosidl-runtime-py rqt-console rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_msg" = substituteSource {
      src = fetchgit {
        name = "rqt_msg-source";
        url = "https://github.com/ros2-gbp/rqt_msg-release.git";
        rev = "0171aafa8d1dd700e104ee98421ee4a5e4ea45d3";
        hash = "sha256-AD3nHOjjAOHbKFshSLeo7W57HAIhBjMJzfzM0woKsQk=";
      };
    };
  });
  meta = {
    description = "A Python GUI plugin for introspecting available ROS message types.";
  };
})
