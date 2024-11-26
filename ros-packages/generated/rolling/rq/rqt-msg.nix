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
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."rqt_msg";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ ament-index-python python-qt-binding rclpy rosidl-runtime-py rqt-console rqt-gui rqt-gui-py rqt-py-common ];
  checkInputs = [ ament-flake8 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "rqt_msg" = substituteSource {
        src = fetchgit {
          name = "rqt_msg-source";
          url = "https://github.com/ros2-gbp/rqt_msg-release.git";
          rev = "c283d62faec39121b5d5cc7ae440a1da9f75e0f4";
          hash = "sha256-HLLdZuTgk34mEBVPJlTRHzk598ItMroTW4gKtcJw0X8=";
        };
      };
    });
  };
  meta = {
    description = "A Python GUI plugin for introspecting available ROS message types.";
  };
})
