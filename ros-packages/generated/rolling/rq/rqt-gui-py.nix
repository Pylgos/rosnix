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
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rqt_gui_py";
  version = "1.9.0-1";
  src = finalAttrs.passthru.sources."rqt_gui_py";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ python-qt-binding qt-gui rclpy rqt-gui ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rqt_gui_py" = substituteSource {
      src = fetchgit {
        name = "rqt_gui_py-source";
        url = "https://github.com/ros2-gbp/rqt-release.git";
        rev = "a38641e4ce4537393091000109d05b98edcf0811";
        hash = "sha256-k9gKdZp6Fv6q9BsDQWuZQYVT7o3CnvxVIx1nsge2l5c=";
      };
    };
  });
  meta = {
    description = "rqt_gui_py enables GUI plugins to use the Python client library for ROS.";
  };
})
